defmodule States.CsvTest do
    use ExUnit.Case
    alias States.Csv

    @csv_helper "./test/helper/csv_input.csv"

    describe "get_states_and_cities/1" do
      test "Should return all the csv file content when path is correct" do
        expected_output = "1504109,Magalhães Barata (PA)\n1504208,Marabá (PA)\n1504307,Maracanã (PA)\n1504406,Marapanim (PA)\n1303106,Nova Olinda do Norte (AM)\n1100064,Colorado do Oeste (RO)\n1100072,Corumbiara (RO)\n1718451,Pugmil (TO)\n1718501,Recursolândia (TO)\n1718550,Riachinho (TO)\n1718659,Rio da Conceição (TO)\n1718709,Rio dos Bois (TO)\n1718758,Rio Sono (TO)\n1718808,Sampaio (TO)\n1718840,Sandolândia (TO)\n1718865,Santa Fé do Araguaia (TO)\n2202117,Campo Alegre do Fidalgo (PI)\n2202133,Campo Grande do Piauí (PI)\n2202174,Campo Largo do Piauí (PI)\n2202208,Campo Maior (PI)\n2202251,Canavieira (PI)\n2309102,Mulungu (CE)\n2309201,Nova Olinda (CE)\n2309300,Nova Russas (CE)\n2309409,Novo Oriente (CE)\n2505303,Curral Velho (PB)\n2505352,Damião (PB)\n2505402,Desterro (PB)"
        
          assert {:ok, expected_output} == Csv.get_states_and_cities(@csv_helper)
        end

      test "Should return error when path is wrong" do
          assert {:error, _} = Csv.get_states_and_cities("")
        end
    end
  end
