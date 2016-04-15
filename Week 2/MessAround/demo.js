var fs = require('fs');
var blah = "Hello"
var done = false;
var obX = function(){
	this.contents = "Heyyo";
	this.getContents = function (file, callback)
	{
		function print (error, content) {

			if (error) 
			{
				console.log("oh no! Error!", error);
			} else {
				callback(content);
			}
		}

		fs.readFile(file, 'utf8', print.bind(this));
	}

}
var obby = new obX();
obby.getContents("file.txt", function(content)
{
		this.contents = content;
		blah = content;
		
});

obby.contents = "Heeeeee";
console.log(obby.contents);	
	
setTimeout(function() {console.log(blah)}, 10);
	
setTimeout(function() {console.log(obby.contents)}, 10);




