App::Application.routes.draw do
  get  "/"               => "ads#root"

  get  "/ads"       			=> "ads#list_ads"
  post "/ads"         		=> "ads#new_ad_post"

  get  "/ads/new"         => "ads#new_ad"
  
  get  "/:id/edit"    => "ads#edit_ad"

  get  "/show_ad/:id"    => "ads#show_ad"

  
  post "/edit_ad/:id"    => "ads#edit_ad_post"

  get  "/destroy_ad/:id" => "ads#destroy_ad"
end
