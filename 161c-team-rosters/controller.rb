require '../dvc-sinatra.rb'

get "/" do 	
  halt erb(:teams)
end

post "/" do 	
  if params[:commit] == "Add"
	  new_team_color = params[:new_team_color]
	  new_team = Team.new
	  new_team.color = new_team_color
	  new_team.save!
	  redirect "/"
  end
end

get "/team/:color" do
	@team_color = params[:color]
  @team = Team.where(color: @team_color).first
  @members = Member.where(team_id: @team.id).all 
  halt erb(:members)
end

post "/team/:color" do
	@team_color = params[:color]
	
	if params[:commit] == "Add"
		new_member_name = params[:new_member_name]
		new_member = Member.new
		new_member.name = new_member_name
		new_member.team_id = Team.where(color: @team_color).first.id
		new_member.save!
		redirect "/team/#{@team_color}"
	end 
end