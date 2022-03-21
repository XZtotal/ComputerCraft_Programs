local estado="Escuchando"
local puertoIni = 23000 -- Puerto inicial que tendria una tortuga con id = 0 , el puerto que tiene cada tortuga es igual a su Id + puertoIni
local puerto= os.getComputerID() + puertoIni
local modem = peripheral.find("modem")
local proximoPrograma
local parametros = {}
modem.open(puerto)
local encendido = true
while encendido do
    
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    if event == "modem_message" then
        
        if message=="programaEnEjecucion" then
            --print("transmitiendo programaEnEjecucion")
            modem.transmit(replyChannel,puerto ,"resprogr".."escucha")

        elseif message=="fuel" then
            --print("transmitiendo fuel
            modem.transmit(replyChannel,puerto ,"resfuel_"..turtle.getFuelLevel())

        elseif message=="estado" then
            modem.transmit(replyChannel,puerto ,"resestad"..estado)

        elseif message== "ejecutarLava" then
            proximoPrograma="lava"
            print("ejecutarLava")
            parametros = {}
            modem.transmit(replyChannel,puerto ,"largura")

        elseif proximoPrograma=="lava" then
            if string.sub(message,1,8)== "reslargu" then
                table.insert(parametros,string.sub(message,9))
                modem.transmit(replyChannel,puerto ,"anchura")

            elseif string.sub(message,1,8)== "resanchu" then
                table.insert(parametros,string.sub(message,9))
                modem.transmit(replyChannel,puerto ,"altura")

            elseif string.sub(message,1,8)== "resaltur" then
                table.insert(parametros,string.sub(message,9))
                modem.transmit(replyChannel,puerto ,"ejecutado")
                os.run({},"lava2.lua",parametros[1],parametros[2],parametros[3])
                parametros={}
                proximoPrograma=""
                
            end
        end
        
    end
end