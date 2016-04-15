var Question = require("./Question.js")
var User = require("./User.js")
var read = require('read');
var fs = require('fs');




var Quiz = function()
{
	
	var users = {};
	var questions = makeQuestions();
	var user = null;
	var highscore = 0;
	var bonus = 0;
	fs.readFile('userInfo.json', function(err, data){
		users = JSON.parse(data);
		var leadList = [];
		for (var name in users)
		{
			var userInfo = {"name" : name, "score" : users[name].score};
			
			leadList.push(userInfo);
		}
		leadList = leadList.sort(function(a,b){
			return b["score"] - a["score"]
		})
		
		for (var leader in leadList)
		{
			if (leadList[leader]["score"] > highscore)
			{
				highscore = leadList[leader]["score"];
			}
			console.log(leadList[leader]["name"] + ":   " + leadList[leader]["score"]);
		}
		checkUser();
	}); //when i want to save do a load users function
	

	function loadUsers(){

	}

	function makeQuestions(){
		var quest_array = []
		quest_array.push(new Question("What is my name?", "Michael", 0));
		quest_array.push(new Question("What language was this written in?", "Javascript", 1));
		quest_array.push(new Question("What is my favorite language?", "Python", 2));
		return quest_array;
	}

	function checkUser(){
		options = {
				prompt : "Enter your name or type 'Exit' to end. \n :"
			}
		read(options, handleUser);
		function handleUser(error, userName)
		{
			if(userName === "Exit"){
				fs.writeFile('userInfo.json', JSON.stringify(users));
				return;
			}
			else if (Object.keys(users).indexOf(userName) === -1)
			{
				users[userName] = new User(userName, 0, 0);
				user = users[userName];
			} else {
				user = users[userName];
			}
			startQuiz();
		}
	}

	function startQuiz(){
		bonus = Math.floor(Math.random()*questions.length)
		ask(user.currentQ);

	}

	function ask(question){
		console.log("Current Score is : " + user.score + "\n")
		if (question === bonus)
		{
			console.log("Bonus Question!!!");
		}
		if (question < questions.length )
		{

			options = {
				prompt : questions[question].text
			}
			read(options, handleAnswer);

			function handleAnswer(err, answer)
			{

				var adder = 1;
				if (question === bonus){
					adder = 2;
				}
				if (answer === "Exit")
				{

					user.currentQ = question; 
					var namecito = user.name;
					users[namecito] = user;
					checkUser();
					return;

				}
				else if (answer === questions[question].answer)
				{
					console.log("Correct");
					user.score += adder;
					if user.score > highscore{
						highscore = user.score;
						Console.log("you just beat the highscore!");
					}

				} else {
					console.log("WRONG");
					user.score -= adder;
				}
				console.log("")
				ask(question+1);
			}
		}else {
			console.log("The quiz is over.")
			console.log(user.name + "\n\n");
			var namecito = user.name;
			users[namecito] = user;
			checkUser();
		}
	}
}

module.exports = Quiz;