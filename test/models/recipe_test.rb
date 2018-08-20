#require 'test_helper'

#class RecipeTest < ActiveSupport::TestCase
	def setup
		@recipe = Recipe.new(name: "vagitable", description: "a great vagitable recipe")
	end

	test "recipe should be valid" do
		assert@recipe.valid?
	end

	test "name should be present" do
		@recipe.name = " "
		assert_not @recipe.valid?
	end

	test "description should be present" do
		@recipe.description = " "
		assert_not @recipe.valid?
    end

    test "description should not be less than 5 chracters" do
    	@recipe.description = "a" * 3
    	assert_not @recipe.valid?
    end

    test "description should not be greater than 500 chracters" do
    	@recipe.description = "a" * 501
    	assert_not @recipe.valid?
    end

#end
