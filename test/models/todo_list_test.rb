require 'test_helper'

class TodoListTest < ActiveSupport::TestCase
    should "require the title to be present" do
      todo_list = Fabricate.build(:todo_list, title: nil)
      assert_not todo_list.valid?
    end

    should "have a parent project" do
      project = Fabricate(:project, title: 'this is my project')
      todo_list = Fabricate(:todo_list, project: project)
      assert_equal todo_list, TodoList.last
    end
end
