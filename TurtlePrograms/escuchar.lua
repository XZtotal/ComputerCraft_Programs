local puertoInicial = 23000 -- Numero desde el cual se empieza a repartir los puertos
local puerto= os.getComputerID() + puertoInicial -- El puerto de esta tortuga sera igual a su Id + puertoInicial (ej: si su Id es 3 y puertoInicial es 30, entonces su puerto sera 33)
local estado="Escuchando"
local modem = peripheral.find("modem")
local proximoPrograma
local parametros = {}
modem.open(puerto)
local encendido = true

print("--- Escuchar ---")
print("Made by XZtotal <3")
print("----------------")
print()
print(" ID = ".. os.getComputerID())
print(" puertoInicial = ".. puertoInicial)
print()
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
        elseif message== "ejecutarCavar" then
            proximoPrograma="cavar"
            print("ejecutarCavar")
            parametros = {}
            modem.transmit(replyChannel,puerto ,"largura")
        elseif message== "ejecutarSuelificar" then
            proximoPrograma="suelificar"
            print("ejecutarSuelificar")
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
                os.run({},"lava2.lua",parametros[1],parametros[2],parametros[3]) -- lava2.lua
                parametros={}
                proximoPrograma=""
                print("--- ESCUCHANDO ---")
                
            end
        elseif proximoPrograma=="cavar" then
            if string.sub(message,1,8)== "reslargu" then
                table.insert(parametros,string.sub(message,9))
                modem.transmit(replyChannel,puerto ,"anchura")

            elseif string.sub(message,1,8)== "resanchu" then
                table.insert(parametros,string.sub(message,9))
                modem.transmit(replyChannel,puerto ,"altura")

            elseif string.sub(message,1,8)== "resaltur" then
                table.insert(parametros,string.sub(message,9))
                modem.transmit(replyChannel,puerto ,"ejecutado")
                os.run({},"cavar4.lua",parametros[1],parametros[2],parametros[3]) -- cavar4.lua
                parametros={}
                proximoPrograma=""
                print("--- ESCUCHANDO ---")
                
            end
        elseif proximoPrograma=="suelificar" then
            if string.sub(message,1,8)== "reslargu" then
                table.insert(parametros,string.sub(message,9))
                modem.transmit(replyChannel,puerto ,"anchura")

            elseif string.sub(message,1,8)== "resanchu" then
                table.insert(parametros,string.sub(message,9))
                modem.transmit(replyChannel,puerto ,"ejecutado")
                os.run({},"suelificar2.lua",parametros[1],parametros[2]) -- suelificar2.lua
                parametros={}
                proximoPrograma=""
                print("--- ESCUCHANDO ---")

               
                
            end
        elseif message=="finalizar" then
            encendido=false
        end
        

        
    end
end