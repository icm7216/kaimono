# frozen_string_literal: true

require "test_helper"

class KaimonoTest < Test::Unit::TestCase
  self.test_order = :defined

  sub_test_case 'Task List' do
    setup do
      args = ["kaimono.yml"]
      @kaimono = Kaimono::Command.new(args)
      @opts = @kaimono.opts
    end

    test "task item" do
      expected = {
        :mylist1 => ["bread  1", "milk   1", "banana 1"],
        :mylist2 => ["bread 2", "milk  2", "banana2"]   
      }
      assert_equal expected, @opts[:task]
    end

    test "yaml file name" do
      expected = "kaimono"
      assert_equal expected, @opts[:filename]
    end
  end



end
