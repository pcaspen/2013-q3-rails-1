play1 = Play.create! play_name: "Macbeth"
play2 = Play.create! play_name: "Twelfth Night"
play3 = Play.create! play_name: "Hamlet"

actor1 = Actor.create! actor_name: "Fred"
actor2 = Actor.create! actor_name: "Lynne"
actor3 = Actor.create! actor_name: "Cathy"

Casting.create! role: "Macbeth", 			play: play1, actor: actor1
Casting.create! role: "Lady Macbeth", play: play1, actor: actor2
Casting.create! role: "Viola", 				play: play2, actor: actor2