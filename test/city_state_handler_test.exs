defmodule States.CityStateHandlerTest do
    use ExUnit.Case
    alias States.CityStateHandler

    describe "slice_by_info/1" do
        test "Should return a list of [state, city] when input is correct" do
            input = "1504109,Magalhães Barata (PA)\n1504208,Marabá (PA)\n1504307,Maracanã (PA)\n1504406,Marapanim (PA)\n1303106,Nova Olinda do Norte (AM)"

            assert [
                        ["(PA)", "Magalhães Barata"], 
                        ["(PA)", "Marabá"], 
                        ["(PA)", "Maracanã"], 
                        ["(PA)", "Marapanim"], 
                        ["(AM)", "Nova Olinda do Norte"]
                    ] = CityStateHandler.slice_by_info(input)
        end
        
        test "Should return an nil if paramter is an empty binary" do
            assert  is_nil(CityStateHandler.slice_by_info(""))
        end

        test "Should return nil when input type is not a binary" do
            assert is_nil(CityStateHandler.list_by_state(nil))
        end
    end
   
    describe "list_by_state/1" do
        test "Should return a map of %{state, city_count} when list input is correct" do
            input = [
                    ["(PA)", "Magalhães Barata"], 
                    ["(PA)", "Marabá"], 
                    ["(PA)", "Maracanã"], 
                    ["(PA)", "Marapanim"], 
                    ["(AM)", "Nova Olinda do Norte"]
                ]

            assert %{"(AM)" => 1, "(PA)" => 4} = CityStateHandler.list_by_state(input)
        end

        test "Should return nil when input type is not a list" do
            assert nil == CityStateHandler.list_by_state(nil)
        end
    end
   
    describe "sort_by_cities_quantity/1" do
        test "Should return a sorted list by city_count of map %{state, city_count}" do
            input = %{"(AM)" => 1, "(PA)" => 4, }

            assert [
                        {"(PA)", 4}, 
                        {"(AM)", 1}
                    ] = CityStateHandler.sort_by_cities_quantity(input)
        end

        test "Should return nil when input type is not a map" do
            assert nil == CityStateHandler.list_by_state(nil)
        end
    end
end
