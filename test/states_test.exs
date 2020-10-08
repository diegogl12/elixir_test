defmodule StatesTest do
  use ExUnit.Case
  alias States

  describe "execute_from_client/1" do
    test "Should return the 3 first registries when no param is passed" do

      assert [
               {"(MG)", 853},
               {"(SP)", 645},
               {"(RS)", 497}
             ] = States.execute_from_client()
    end

    test "Should return the 5 first registries when 5 is a param" do
      assert [
               {"(MG)", 853},
               {"(SP)", 645},
               {"(RS)", 497},
               {"(BA)", 417},
               {"(PR)", 399}
             ] = States.execute_from_client(5)
    end
  end

  describe "execute_from_csv/1" do
    test "Should return the 3 first registries when no param is passed" do
      assert [
               {"(MG)", 853},
               {"(SP)", 645},
               {"(RS)", 497}
             ] = States.execute_from_csv()
    end

    test "Should return the 5 first registries when 5 is a param" do
      assert [
               {"(MG)", 853},
               {"(SP)", 645},
               {"(RS)", 497},
               {"(BA)", 417},
               {"(PR)", 399}
             ] = States.execute_from_csv(5)
    end
  end
end
