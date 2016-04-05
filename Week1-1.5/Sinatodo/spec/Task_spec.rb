require_relative "../lib/Task.rb"

RSpec.describe "Task" do 
	before :each do
		@task = Task.new("Mow the lawn")
	end
	describe "#complete?" do 
		it "returns false if the task is not complete" do
			expect(@task.complete?).to eq(false)
			@task.complete!
			expect(@task.complete?).to eq(true)
		end
	end
	describe "#complete!" do 
		it "changes the complete attribute to true" do
			@task.complete!
			expect(@task.complete?).to eq(true)
		end
	end
	describe "#incomplete!" do 
		it "changes the complete attribute to false" do 
			@task.complete!
			@task.incomplete!
			expect(@task.complete?).to eq(false)
		end
	end
	describe "#update_content" do 
		it "changes the content attribute to whatever you set" do 
			@task.update_content("Mow the grass")
			expect(@task.content).to eq("Mow the grass")
		end
	end

end
