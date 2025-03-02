# Game Pao Ying Cub
# 10 rounds and calculate score

Choice <- c("Hammer","Scissors","Paper")

Start_game <- function(){
  round_game <- 0
  player_score <- 0
  bot_score <- 0
  
  while (round_game < 10) {
    
    player_hand <- readline("You can win or not! Just choose : ")
    
    if (player_hand %in% Choice) {
    
    bot <- sample(Choice, size = 1)
    
    if (player_hand == "Hammer" && bot == "Paper") {
      print(paste0("I got you I choose : ",bot))
      bot_score = bot_score + 1
    } else if(player_hand == "Paper" && bot == "Scissors"){
      print(paste0("I got you I choose : ",bot))
      bot_score = bot_score + 1
    } else if(player_hand == "Scissors" && bot == "Hammer"){
      print(paste0("I got you I choose : ",bot))
      bot_score = bot_score + 1
    } else if(player_hand == bot){
      print(paste0("Draw I choose : ", bot))
    } else {
      print("Nah that's bad")
      player_score = player_score + 1
    }
    
    round_game = round_game + 1
    } else {
      print("Inorrect choice try agian")
    }
  }
    
    if (round_game == 10) {
      if (player_score > bot_score) {
         print(paste0("Incredible you are winner with player score : bot score >>> ",
                     player_score, " : ",bot_score))
      } else if(player_score < bot_score){
         print(paste0("You lose haha with player score : bot socre >>> ",
                   player_score, " : ", bot_score))
      }else{
      print("Just tried")
    }
  }
} 
