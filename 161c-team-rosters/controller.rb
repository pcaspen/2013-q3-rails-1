require '../dvc-sinatra.rb'

get "/" do
	@teams = Team.all
  halt erb(:teams)
end

post "/" do
	if params[:commit] == "Add"
		new_team = Team.new
		new_team.color = params[:color]
		new_team.save!
	end	
  halt erb(:teams)
end

get "/team/:color" do
  # WHAT DO I HAVE AS PARAMS? team.color (violet) --> team.id (2) --> member.team_id (2)
  # WHERE DO I NEED TO GO?     pull list of members with member.team_id = 2 
  color = params[:color]
  @team = Team.where(color: color).first # pulls out one team object with id and color
  @members = Member.where(team_id: @team.id).all
  halt erb(:members)
end

post "/team/:color" do
  color = params[:color]
  if params[:commit] == "Add"
    new_member = Member.new
    new_member.name = params[:name]
    new_member.team_id = Team.where(color: color).first.id
    new_member.save!
  end
  redirect "/team/#{color}"
end