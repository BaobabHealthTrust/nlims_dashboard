# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


sites = YAML.load_file("#{Rails.root}/public/sites.yml")


sites.each do |key,site|

	site.each do |s|
		Site.create(
				name: s['facility'],
				district: key,
				x: s['longitude'],
				y: s['latitude'],
				region: s['region'],
				description: s['facility_type'],
				enabled: false,
				sync_status: false,
				site_code: 'kch',
				application_port: '0000',
				host_address: '192.168.120.500'
			)
	end
end
