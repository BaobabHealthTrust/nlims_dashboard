Rails.application.routes.draw do
 

	root "home#home"
	get  "/home" => "home#home"
	get  "/moh_report" => "report#moh_report"
	post "/get_report" => "report#get_report"
	get  "/get_report" => "report#get_report"
	post "/get_general_counts" => "home#get_general_counts"
	get  "/get_general_counts" => "home#get_general_counts"
	post "/get_test_statuses" => "home#get_test_statuses"
	get  "/get_test_statuses" => "home#get_test_statuses"
	post "/get_tb_counts" => "home#get_tb_tests_counts"
	get  "/get_tb_counts" => "home#get_tb_tests_counts"

end
