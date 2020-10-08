defmodule States.ClientTest do
    use ExUnit.Case
    alias States.Client

    setup do
        bypass = Bypass.open()
        %{bypass: bypass}
      end

    describe "get_states_and_cities/1" do
      test "Should return all the csv body content when path is correct", %{bypass: bypass} do
        Bypass.expect(bypass, fn conn ->
            resp_body = "1504109,Magalhães Barata (PA)\n1504208,Marabá (PA)\n1504307,Maracanã (PA)\n1504406,Marapanim (PA)\n1303106,Nova Olinda do Norte (AM)\n1100064,Colorado do Oeste (RO)\n1100072,Corumbiara (RO)\n1718451,Pugmil (TO)\n1718501,Recursolândia (TO)\n1718550,Riachinho (TO)\n1718659,Rio da Conceição (TO)\n1718709,Rio dos Bois (TO)\n1718758,Rio Sono (TO)\n1718808,Sampaio (TO)\n1718840,Sandolândia (TO)\n1718865,Santa Fé do Araguaia (TO)\n2202117,Campo Alegre do Fidalgo (PI)\n2202133,Campo Grande do Piauí (PI)\n2202174,Campo Largo do Piauí (PI)\n2202208,Campo Maior (PI)\n2202251,Canavieira (PI)\n2309102,Mulungu (CE)\n2309201,Nova Olinda (CE)\n2309300,Nova Russas (CE)\n2309409,Novo Oriente (CE)\n2505303,Curral Velho (PB)\n2505352,Damião (PB)\n2505402,Desterro (PB)"
            Plug.Conn.resp(conn, 200, resp_body)
        end)
        expected_response = "1504109,Magalhães Barata (PA)\n1504208,Marabá (PA)\n1504307,Maracanã (PA)\n1504406,Marapanim (PA)\n1303106,Nova Olinda do Norte (AM)\n1100064,Colorado do Oeste (RO)\n1100072,Corumbiara (RO)\n1718451,Pugmil (TO)\n1718501,Recursolândia (TO)\n1718550,Riachinho (TO)\n1718659,Rio da Conceição (TO)\n1718709,Rio dos Bois (TO)\n1718758,Rio Sono (TO)\n1718808,Sampaio (TO)\n1718840,Sandolândia (TO)\n1718865,Santa Fé do Araguaia (TO)\n2202117,Campo Alegre do Fidalgo (PI)\n2202133,Campo Grande do Piauí (PI)\n2202174,Campo Largo do Piauí (PI)\n2202208,Campo Maior (PI)\n2202251,Canavieira (PI)\n2309102,Mulungu (CE)\n2309201,Nova Olinda (CE)\n2309300,Nova Russas (CE)\n2309409,Novo Oriente (CE)\n2505303,Curral Velho (PB)\n2505352,Damião (PB)\n2505402,Desterro (PB)"

        assert {:ok, expected_response} == Client.get_states_and_cities("http://localhost:#{bypass.port}")
        end

        test "Should return error the api responds with status code diferent then 200", %{bypass: bypass} do
            Bypass.expect(bypass, fn conn ->
                Plug.Conn.resp(conn, 500, "")
            end)
    
            assert {:error, _} = Client.get_states_and_cities("http://localhost:#{bypass.port}")
            end
    end

  end