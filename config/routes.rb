Rails.application.routes.draw do
 

 root "home#home"

get  "/moh_report" => "report#moh_report"
post "/get_report" => "report#get_report"
get "/get_report" => "report#get_report"

end
