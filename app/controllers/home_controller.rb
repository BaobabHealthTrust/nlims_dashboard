class HomeController < ApplicationController

	def home
		@sites = Site.where(:enabled => true)
		@years = get_distinct_years
	end

	def get_distinct_years
		years = Order.find_by_sql("SELECT DISTINCT substr(orders.date_created,1,4) AS yr FROM orders")
		yr = []
		if years
			yr.push(years[0]['yr'])
			yr.push(years[1]['yr'])
			yr.push(years[2]['yr'])
		end
		return yr
	end

	def get_general_counts
		period = params[:year]
		data = []

			res = TestType.where(name: "Syphilis Test").first
			test_id = res.id
			res = Test.find_by_sql("SELECT count(*) AS test_count FROM 
									tests WHERE test_type_id = '#{test_id}' AND 
									(substr(time_created,1,4) = '#{period}')"

								)
			value_count = res[0].test_count
		
			res = TestType.where(name: "Syphilis Test").first
			test_id = res.id
			res = Test.find_by_sql("SELECT count(*) AS test_count FROM 
										tests INNER JOIN test_results ON test_results.test_id = tests.id 
										INNER JOIN measures ON measures.id = test_results.measure_id
										INNER JOIN orders ON orders.id = tests.order_id
										INNER JOIN patients ON patients.id = orders.patient_id
										WHERE (test_type_id = '#{test_id}') 
										AND 
										(substr(tests.time_created,1,4) = '#{period}' AND ((measures.name = 'TPHA' OR measures.name = 'VDRL' OR measures.name = 'RPR') AND test_results.result ='Reactive' ))"
									)
			value_counter = res[0].test_count
			
			data[0] = {
					"Syphilis Test Examined" => value_count,
					"Positive Syphilis Test" => value_counter,
			}



			render plain: data.to_json and return
	end

	def get_test_statuses
		period = params[:year]
		data = []

			res = Test.find_by_sql("SELECT count(*) AS test_count FROM 
									tests WHERE 
									(substr(time_created,1,4) = '#{period}')"

								)
			total_count = res[0].test_count



			res = TestStatus.where(name: "verified").first
			test_id = res.id
			res = Test.find_by_sql("SELECT count(*) AS test_count FROM 
									tests WHERE test_status_id = '#{test_id}' AND 
									(substr(time_created,1,4) = '#{period}')"

								)
			value_count = res[0].test_count
			value_count = (value_count.to_f  / total_count.to_f) * 100

			data[0] = {
				"verified" => value_count.to_i
			}
			


			res = TestStatus.where(name: "completed").first
			test_id = res.id
			res = Test.find_by_sql("SELECT count(*) AS test_count FROM 
									tests WHERE test_status_id = '#{test_id}' AND 
									(substr(time_created,1,4) = '#{period}')"

								)
			value_count = res[0].test_count
			value_count = (value_count.to_f  / total_count.to_f) * 100

			data[1] = {
				"completed" => value_count.to_i
			}


			res = TestStatus.where(name: "started").first
			test_id = res.id
			res = Test.find_by_sql("SELECT count(*) AS test_count FROM 
									tests WHERE test_status_id = '#{test_id}' AND 
									(substr(time_created,1,4) = '#{period}')"

								)
			value_count = res[0].test_count
			value_count = (value_count.to_f  / total_count.to_f) * 100

			data[2] = {
				"started" => value_count.to_i
			}
			

			res = TestStatus.where(name: "pending").first
			test_id = res.id
			res = Test.find_by_sql("SELECT count(*) AS test_count FROM 
									tests WHERE test_status_id = '#{test_id}' AND 
									(substr(time_created,1,4) = '#{period}')"

								)
			value_count = res[0].test_count
			value_count = (value_count.to_f  / total_count.to_f) * 100

			data[3] = {
				"pending" => value_count.to_i
			}
			

			res = TestStatus.where(name: "drawn").first
			test_id = res.id
			res = Test.find_by_sql("SELECT count(*) AS test_count FROM 
									tests WHERE test_status_id = '#{test_id}' AND 
									(substr(time_created,1,4) = '#{period}')"

								)
			value_count = res[0].test_count
			value_count = (value_count.to_f  / total_count.to_f) * 100

			data[4] = {
				"drawn" => value_count.to_i
			}


			res = TestStatus.where(name: "test-rejected").first
			test_id = res.id
			res = Test.find_by_sql("SELECT count(*) AS test_count FROM 
									tests WHERE test_status_id = '#{test_id}' AND 
									(substr(time_created,1,4) = '#{period}')"

								)
			value_count = res[0].test_count
			value_count = (value_count.to_f  / total_count.to_f) * 100

			data[5] = {
				"test-rejected" => value_count.to_i
			}



			render plain: data.to_json and return
	end


	def get_tb_tests_counts

		period = params[:year]

		res = TestType.where(name: "TB Tests").first
						test_id = res.id
						res = Test.find_by_sql("SELECT count(*) AS test_count FROM 
										tests WHERE test_type_id = '#{test_id}' AND 
										(substr(time_created,1,4) = '#{period}')"

										)

		value_count = res[0].test_count
		value_count.to_i
	
		render plain: value_count and return
	end

	
end
