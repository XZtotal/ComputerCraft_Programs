local largo, ancho,alto = ...
local puertoInicial = 23000 -- Numero desde el cual se empieza a repartir los puertos
local puerto= os.getComputerID() + puertoInicial -- El puerto de esta tortuga sera igual a su Id + puertoInicial (ej: si su Id es 3 y puertoInicial es 30, entonces su puerto sera 33)
local x=0
local y=0
local z=0
local xg=0 --x guardado
local yg=0 --y guardado
local zg=0 --z guardado
local direcciong = 0 --direccion guardada
local xMax = 0
local yMax = 0
local zMax = 0
local direccion = 0 --0 = alante,  1 = derecha, 2 = atras,  3=izquierda

local estado="undefined"
local modem = peripheral.find("modem")
local alturaC --altura a la que comienza
local puedeCojerLava=true;
local idControl = {1,2,3}
local modoDeFuncionamiento = 0 -- normal=0 , preceso de apagado=1, apagar=2
local capasAcabadas = 0 --capas "y" ya cavadas
local modoDeCavado = 0 --0 = bloques de enfrente, 1 = enfrente y arriba, 2=arriba abajo y enfrente, -1 = enfrente y abajo, -2=arriba abajo y enfrente
print("--- Lava2 ---")
print("Made by XZtotal")
print("-------------")
print("")
if not largo then
    term.write("Largura ? : ")
    largo =  read()
end
largo = tonumber(largo)
if  largo=="" or largo==0 or largo==-1 then
    largo = 1
end

largo = math.abs(largo)

xMax = xMax + largo - 1
   
if not ancho then
    term.write("Anchura ? : ")
    ancho =  read()
end
ancho = tonumber(ancho)
if  ancho=="" or ancho==0 or ancho==-1 then
    ancho = 1
end
if ancho>0 then
    yMax = yMax + ancho - 1
    else
    yMax = yMax + ancho + 1
end

if not alto then
    term.write("Altura ? : ")
    alto =  read()
end
alto = tonumber(alto)
alto =math.abs(alto)*-1
if  alto=="" or alto==0 or alto==-1 then
    alto = 1
end
if alto>0 then
    zMax = zMax + alto 
    else
        zMax = zMax + alto 
end
--term.clear()
print("-- INICIANDO LAVA2 --")
print("Puerto : "..puerto)
print("Fuel : "..turtle.getFuelLevel())

--term.setCursorPos(1,10)
--print(xMax)
--term.scroll(1)
--term.setCursorPos(1,10)
--print(yMax)
--term.scroll(1)
--term.setCursorPos(1,10)
--print(zMax)
--term.scroll(1)

function prepModoDeCabado()
    --[[
    if alto - capasAcabadas == 1 then
        modoDeCavado=0
    elseif alto - capasAcabadas == 2 then
        modoDeCavado = 1
    elseif alto - capasAcabadas > 0 then
        modoDeCavado = 2
        movVertical(1)
    elseif alto - capasAcabadas == -1 then
        modoDeCavado = 0
    elseif alto - capasAcabadas == -2 then
        modoDeCavado = -1
    else
        modoDeCavado=-2
        movVertical(-1)
    end
    ]]
    modoDeCavado=-1
   --[[ 
       if alto-capasAcabadas+1<=-5 then
        capasAcabadas=-5
        else
            capasAcabadas=alto-capasAcabadas
    end 
    ]]
    
end
function palante()
    --term.setCursorPos(1,10)
    --print(" palante ")
    --print(modoDeCavado)
    --term.scroll(1)
    
    fuel()
    turtle.dig()
    if modoDeCavado>0 then
        turtle.digUp()
    end
    if modoDeCavado == 2 then
        turtle.digDown()
    end
    if modoDeCavado<0 then
        turtle.digDown()
        cojerLava()
    end

    if modoDeCavado == -2 then
        turtle.digUp()
    end


    
        if  turtle.forward() then
            if direccion==0 then
                x=x+1
            elseif direccion==2 then
                x=x-1
            elseif direccion==1 then
                y=y+1
            else
                y=y-1
            end
            
        else
            modoDeFuncionamiento=1
        end
     

    

end

function cambiarDeFila()
    --term.setCursorPos(1,10)
    --print(" cambiarDeFila ")
    --term.scroll(1)
    estado="Cambiando de fila"
    
    if ancho>0 then
        if (x==xMax and direccion==0) then
            rotar(1)
            palante()
            rotar(1)
            
        else
            rotar(-1)
            palante()
            rotar(-1)
            
        end
    
    else
        if (x==xMax and direccion==0) then
            
            rotar(-1)
            palante()
            rotar(-1)

        else
            rotar(1)
            palante()
            rotar(1)
        end
        
    end
end
function guardarPos()
    xg=x
    yg=y
    zg=z
    direcciong=direccion
end
function irPosGuardada()
    goTo(xg,yg,zg)
    forceRotation(direcciong)
    
end  

function vaciarInv()
    estado="vaciando Inv"
        local sel = turtle.getSelectedSlot()
        --print("--- Vaciando Inv")
        for i = 1, 16, 1 do
            turtle.select(i)
            if not (turtle.getItemCount(i)==0) then
                if  turtle.getItemDetail(i).name=="minecraft:lava_bucket" then
                    
                    local success, data = turtle.inspect()
                    if not success then
                        turtle.place()
                    else
                        while success do
                            sleep(0.3)
                            success, data = turtle.inspect()
                        end
                        turtle.place()
                    end
                elseif not ( turtle.getItemDetail(i).name=="minecraft:bucket") then
                    turtle.drop()
                end
            
            end
            
        end
        turtle.select(sel)
        --print("Vaciando ---")
end
function cojerLava()
    
    if puedeCojerLava then
        estado="Cojiendo Lava"
        local lavaPorColumna=1
        local s,data =turtle.inspectDown()  

        if s and data.state.level then
            
        
            if   data.state.level==0 then

                if zMax - z <= -5 then
                    lavaPorColumna=5;
                else
                    lavaPorColumna= math.abs(zMax - z)
                end
                turtle.select(SlotConBloque())
                turtle.placeDown()
                sleep(2)
            
                for i = 1, lavaPorColumna-1, 1 do
                    turtle.select(SlotConBloque())
                    turtle.placeDown()
                    sleep(0.5)
                end
            end   
        
        end
        
    end
    
end
function invVacio()
    local res
    for i = 1, 16, 1 do
        if not (turtle.getItemCount(i)==0) then
            
        
            if turtle.getItemDetail(i).name=="minecraft:bucket" then
                res = false
                --print("cubo")
                break
            elseif i==16 and not (turtle.getItemDetail(i).name=="minecraft:bucket") then
                res = true
                --print("no cubo")
            end
        elseif turtle.getItemCount(i)==0 and i==16 then 
            res = true
            --print("nunca cubo")
        end
    end
    return res
end

function SlotConBloque()
    local a = turtle.getSelectedSlot()
    
    if not (invVacio()) then
        for i = 1, 16, 1 do
            if not (turtle.getItemCount(i)==0) then
                if turtle.getItemDetail(i).name=="minecraft:bucket" then
                    a=i
                    break
                end
                
            end
        end
    else
        comprobarInv()
        a = turtle.getSelectedSlot()
    end
    --print(a)
    return a;
end

function comprobarInv()
    if  invVacio() then
        --print("comprb : inv vacio")
        guardarPos()
        local mdc= puedeCojerLava
        puedeCojerLava = false
        goTo(0,0,0)
        forceRotation(2)
        vaciarInv()
        irPosGuardada()
        puedeCojerLava=mdc

    end
end

function movVertical(n) -- n<0 (para abajo), n>0 (para arriba)
    
    if n>0 then
        fuel()
        turtle.digUp()
        if  turtle.up() then
            
            z=z+1
        
         else
            modoDeFuncionamiento=2
        end

        
    elseif n<0 then
        fuel()
        turtle.digDown()
        if  turtle.down() then
            
            z=z-1
        
         else
            modoDeFuncionamiento=2
        end
            
    end

        

end

function fuel()
    
    if turtle.getFuelLevel()<200 then
        estado="Cargando Fuel"
        --print(" fuel ")
    --print(turtle.getFuelLevel())
    --print(" --> ")
    
        local sel= turtle.getSelectedSlot()
        for i = 1, 16 , 1 do
            turtle.select(i)
            if turtle.refuel(2) then
                
                --print(turtle.getFuelLevel())
                break
            end

        end
        turtle.select(sel)
        --term.scroll(1)
    end
end

function restaZMax() --devuelve 1,0 y -1 segun el metodo de miando
    local i=0
    if modoDeCavado<0 then
        i=-1
    elseif modoDeCavado>0 then
        i=1
    else
        i=0
    end
    return i;
end

function forceRotation(r)
    if not (r == direccion) then
        
    
        if direccion == 0 or direccion == 1 then
        if direccion + 1 == r then
                rotar(1)
            elseif direccion - 1 == r  then
                rotar(-1)
            else
                rotar(1)
                rotar(1)
            end
            
        elseif direccion == -1 then
            if r == 0 then
                rotar(1)
            elseif  r == 2 then
                rotar(-1)
            else
                rotar(1)
                rotar(1)
            end  
        elseif direccion == 2 then
            if r == -1 then
                rotar(1)
            elseif  r == 1 then
                rotar(-1)
            else
                rotar(1)
                rotar(1)
            end  

        end
    end
end
function goTo(nx,ny,nz)
    local vx= nx-x
    local vy= ny-y
    local vz= nz-z
    if vx<0 then
        forceRotation(2)
    else 
        forceRotation(0)
    end
    for i = 1, math.abs(vx), 1 do
        palante()

    end 

    if vy<0 then
        forceRotation(-1)
    else 
        forceRotation(1)
    end
    for i = 1, math.abs(vy), 1 do
        palante()
    end
    for i = 1, math.abs(vz), 1 do
        movVertical(vz)
    end

end
    

function rotar(n)-- -1= izq  o  1=dere
    if n>0 then
        
       turtle.turnRight()
       direccion = direccion + 1
        if direccion > 2 then
                direccion = -1;
        end
    else
        turtle.turnLeft()
        direccion = direccion - 1
        if direccion < -1 then
                direccion=2;
        end
    end
    
end

function cavando()
    if (x == xMax and y == yMax and (zMax - z >=-5) and direccion==0) or (x == 0 and y == yMax and (zMax - z >=-5) and direccion==2)  then --ha terminado
        local pcl=puedeCojerLava
        puedeCojerLava=false
        estado="terminando"
        goTo(0,0,0)
        
        puedeCojerLava=pcl
        forceRotation(2)
        vaciarInv()
        forceRotation(0)
        modoDeFuncionamiento=2;

    elseif  (x == xMax and  y == yMax and direccion==0) or ((x == 0 and  y == yMax and direccion==2)) then --termina una capa
       local pcl=puedeCojerLava
       puedeCojerLava=false
        goTo(0,0,z)
        puedeCojerLava=pcl
        
        forceRotation(0)
        for i = 1, 5, 1 do
            movVertical(-1)
        end
                prepModoDeCabado()
        
        

    elseif (x==0 and direccion==2) or (x==xMax and direccion==0) then --termina una fila
        cambiarDeFila()

    else
        comprobarInv()
        palante()

    end
end

parallel.waitForAny(
    function()
        prepModoDeCabado()
        while not (modoDeFuncionamiento==2) do
            if modoDeFuncionamiento==0 then
                cavando()
            elseif modoDeFuncionamiento == 1 then
                goTo(0,0,0)
                forceRotation(2)
                vaciarInv()
                forceRotation(0)
                modoDeFuncionamiento=2
            end
        end    
    end
,
    function()
        if modem then
            modem.open(puerto)
        end

        while true do
            if modem then
                local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                if event == "modem_message" then
                    if message=="finalizar"  then
                        estado="Finalizando"
                        puedeCojerLava=false
                        print("-_ Se ha forzado la finalizacion por modem_message _-")
                        modem.transmit(replyChannel,puerto ,"resfinalfinalizado")
                        modoDeFuncionamiento=1 
                    elseif message=="programaEnEjecucion" then
                        --print("transmitiendo programaEnEjecucion")
                        modem.transmit(replyChannel,puerto ,"resprogrlava")
                    elseif message=="fuel" then
                        --print("transmitiendo fuel")
                        modem.transmit(replyChannel,puerto ,"resfuel_"..turtle.getFuelLevel())
                    elseif message=="estado" then
                        modem.transmit(replyChannel,puerto ,"resestad"..estado)
                    elseif message=="xRel" then
                        modem.transmit(replyChannel,puerto ,"resxrel_"..x)
                    elseif message=="yRel" then
                        modem.transmit(replyChannel,puerto ,"resyrel_"..y)
                    elseif message=="zRel" then
                        modem.transmit(replyChannel,puerto ,"reszrel_"..z)
                    end
                    
                end
            else
                sleep(2)
            end
        end
    end


)


