---@diagnostic disable: deprecated, lowercase-global
--Made by XZtotal <3
local puertoInicial = 23000 -- Numero desde el cual se empieza a repartir los puertos
local puerto= os.getComputerID() + puertoInicial -- El puerto de esta dispositivo sera igual a su Id + puertoInicial (ej: si su Id es 3 y puertoInicial es 30, entonces su puerto sera 33)
local  anchuraPantalla, alturaPantalla = term.getSize()
--local objeto = {} -- {type,id,text,funcion}
local enlaces={0,2}
local colaDeVentanas = {}
local encendido = true
local modem = peripheral.find("modem")
if modem then
    modem.open(puerto)
end



function generarPantalla(tipo) --tipo = {name,arg}
    
    local arg = nil
    if table.maxn(tipo)>1 then
        arg=tipo[2]
    end

    local pantalla={tipo={name=tipo[1],arg=arg},anchura=0,altura=0,objetos={}}
    pantalla.anchura = anchuraPantalla
    pantalla.altura = alturaPantalla
    local altRestante=pantalla.altura
    local ancRestante=pantalla.anchura
    local idDisp={}
    

    idDisp[1]=1
    
    table.insert(colaDeVentanas,pantalla)
    
    os.queueEvent("pantalla","terminar")
        
    
    
    if tipo[1]=="main" then

        local o = generarShell(pantalla,idDisp) --1
        idDisp[1]=idDisp[1]+1
        table.insert(pantalla.objetos,o)



        local o = generaTabla(idDisp,1,2,anchuraPantalla,19,"",{ --2
           
            generarBoton({1}, nil, nil, 5, 1, "Cargando...", {"xzOs","irAnteriorVentana"}, colors.gray, colors.white),
        --[[generarText({1}, nil, nil, 6, 1, "222", colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6 , 1, "333", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 3 , 1, "444", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6, 1, "555", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6 , 1, "666", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 3 , 1, "777", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white)
            ,
            generarBoton({1}, nil, nil, 6, 1, "888", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6 , 1, "999", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 3 , 1, "000", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6, 1, "1111", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6 , 1, "2222", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 3 , 1, "3333", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white)
            ,
            generarBoton({1}, nil, nil, 6, 1, "4444", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6 , 1, "5555", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 3 , 1, "6666", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6, 1, "7777", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6 , 1, "8888", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 3 , 1, "9999", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white)
            ,
            generarBoton({1}, nil, nil, 6, 1, "00000", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6 , 1, "11111", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 3 , 1, "22222", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6, 1, "33333", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6 , 1, "44444", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 3 , 1, "55555", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white)
            ,
            generarBoton({1}, nil, nil, 6, 1, "hhhhh", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6 , 1, "hh", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 3 , 1, "hhh", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6, 1, "hhhqqq", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 6 , 1, "hhhh-----", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white),
            generarBoton({1}, nil, nil, 3 , 1, "hhhhhh", {"xzOs","irAnteriorVentana"}, colors.brown, colors.white)
]]

        },colors.black  ,nil,true,1)
        idDisp[1]=idDisp[1]+1
        table.insert(pantalla.objetos,o)
        
        os.queueEvent("pantalla","main","iniciar")

    elseif tipo[1]=="tortuga" then --Tortuga

        local o = generarShell(pantalla,idDisp) --1
        idDisp[1]=idDisp[1]+1
        table.insert(pantalla.objetos,o)

        local o = generaTabla(idDisp,1,2,anchuraPantalla,16,"",{ --2
           
            generarBoton({1}, nil, nil, 5, 1, "Cargando...", {"xzOs","irAnteriorVentana"}, colors.gray, colors.white)
            
        

        },colors.gray  ,nil,true,1)
        idDisp[1]=idDisp[1]+1
        table.insert(pantalla.objetos,o)

        local o = generaTabla(idDisp,1,10,anchuraPantalla,8,"",{ --3
        generarBoton({1}, nil, nil, 5, 1, "- Ejecutar Lava", {"tortuga","ejecutarLava",pantalla.tipo.arg}, colors.blue, colors.white),
        generarBoton({1}, nil, nil, 5, 1, "- Ejecutar Cavar", {"tortuga","ejecutarCavar",pantalla.tipo.arg}, colors.blue, colors.white),
        generarBoton({1}, nil, nil, 5, 1, "- Ejecutar Suelificar", {"tortuga","ejecutarSuelificar",pantalla.tipo.arg}, colors.blue, colors.white)

            
        },colors.gray  ,nil,false,1)
        idDisp[1]=idDisp[1]+1
        table.insert(pantalla.objetos,o)

        local o = generarBoton(idDisp, 2, 19, 9, 1, "Finalizar", {"tortuga","finalizar",pantalla.tipo.arg}, colors.red, colors.white) --4
        idDisp[1]=idDisp[1]+1
        table.insert(pantalla.objetos,o)
        os.queueEvent("pantalla","tortuga","iniciar")


   
   
    elseif tipo[1]=="ejecutarLava" then --Tortuga
        
        local o = generarShell(pantalla,idDisp) --1
        idDisp[1]=idDisp[1]+1
        table.insert(pantalla.objetos,o)

        


        

        
        os.queueEvent("pantalla","ejecutarLava","iniciar")
    elseif tipo[1]=="ejecutarCavar" then --Tortuga
        
        local o = generarShell(pantalla,idDisp) --1
        idDisp[1]=idDisp[1]+1
        table.insert(pantalla.objetos,o)

        


        

        
        os.queueEvent("pantalla","ejecutarCavar","iniciar")
    elseif tipo[1]=="ejecutarSuelificar" then --Tortuga
        
        local o = generarShell(pantalla,idDisp) --1
        idDisp[1]=idDisp[1]+1
        table.insert(pantalla.objetos,o)

        


        

        
        os.queueEvent("pantalla","ejecutarSuelificar","iniciar")
    end
    

    imprimirPantalla(pantalla)
    return pantalla
end

function generarShell(p,id)
    local r = {tipo="shell",id={},x=1,y=1,altura=1,anchura=p.anchura, color=colors.yellow, objetos={},visible=true}
    r.id = copiarTablaSimple(id)
    local idDisp=1
            -- Boton = {"boton",id,x,y,alt,anch,text,color,textColor,funcion}

    --boton H
    local o = generarBoton(copiarTablaSimple(r.id), 1, 1, 1, 1, "H", {"xzOs","irVentana",1}, colors.green, colors.white)
    --local o = {tipo="boton", id=r.id, x=1, y=1, altura=1, anchura=1,text="H",color= colors.green, textColor=colors.white ,funcion={"xzOs","irVentana",1}}
    table.insert(o.id,idDisp)
    
    idDisp=idDisp+1
    table.insert(r.objetos,o)

    --boton <
    local o = generarBoton(copiarTablaSimple(r.id), 2, 1, 1, 1, "<", {"xzOs","irAnteriorVentana"}, colors.orange, colors.white)
   -- local o = {tipo="boton", id=r.id, x=2, y=1, altura=1, anchura=1,text="<",color= colors.orange, textColor=colors.white ,funcion={"xzOs","irAnteriorVentana"}}
   
    table.insert(o.id,idDisp)
    
    idDisp=idDisp+1
    table.insert(r.objetos,o)

    --boton X
    
    local o = generarBoton(copiarTablaSimple(r.id), r.anchura, 1, 1, 1, "x", {"xzOs","cerrar"}, colors.red, colors.white)
    --local o = {tipo="boton", id=r.id, x=r.anchura, y=1, altura=1, anchura=1,text="x",color= colors.red, textColor=colors.white ,funcion={"xzOs","cerrar"}}
    
    table.insert(o.id,idDisp)
    
    idDisp=idDisp+1
    table.insert(r.objetos,o)

    --botones De Direccion
    local espacio = r.anchura - 7
    local n = 1
    local elementosDeCola = table.maxn(colaDeVentanas)
    local maxLetras=0
    local encontrado = false
    while elementosDeCola-n >=0 and not encontrado do
        maxLetras=0
        for i = n, elementosDeCola, 1 do
            if string.len(colaDeVentanas[i].tipo.name)>maxLetras then
                maxLetras=string.len(colaDeVentanas[i].tipo.name)
            end
        end
        local conteoLetras = espacio+1
    
        while maxLetras>=3 and  not(conteoLetras <= espacio) do
            conteoLetras = elementosDeCola-n --numero de \
            for i = n, elementosDeCola, 1 do
                if string.len(colaDeVentanas[i].tipo.name)>maxLetras then
                    conteoLetras = conteoLetras + maxLetras
                else
                    conteoLetras = conteoLetras + string.len(colaDeVentanas[i].tipo.name)
                end
                
            end
           if not(conteoLetras <= espacio) then
                maxLetras = maxLetras - 1
           else
                encontrado=true
           end

        end
    
        if not encontrado then
            n=n+1
        end
    end
    
    if n>=1 and n<=elementosDeCola then
        local pos=6
        if n==1 then
            --o = {tipo="text", id= copiarTablaSimple(r.id), x=4, y=1, altura=1, anchura=2,text="  ",color= r.color, textColor = colors.black}
            o = generarText(copiarTablaSimple(r.id),4,1,2,1,"  ",r.color,colors.black,true)
            
                table.insert(o.id,idDisp)
                idDisp=idDisp+1
                table.insert(r.objetos,o)
                
        else
            -- o = {tipo="text", id= copiarTablaSimple(r.id), x=4, y=1, altura=1, anchura=2,text=".\\",color= r.color, textColor = colors.black}
            o = generarText(copiarTablaSimple(r.id),4,1,2,1,".\\",r.color,colors.black,true)
                table.insert(o.id,idDisp)
                idDisp=idDisp+1
                table.insert(r.objetos,o)
                
        end

        for i = n, elementosDeCola, 1 do
            
            local a = colaDeVentanas[i].tipo.name
            if string.len(a) > maxLetras then
                a=string.sub(a,1,maxLetras)
            end
            o = generarBoton(copiarTablaSimple(r.id), pos, 1, string.len(a), 1, a, {"xzOs","irVentana",i}, colors.orange, colors.black)
            --o = {tipo="boton", id=r.id, x=pos, y=1, altura=1, anchura=string.len(a),text=a ,color= colors.orange, textColor=colors.black ,funcion={"xzOs","irVentana",n}}
           
            table.insert(o.id,idDisp)
            idDisp=idDisp+1
            table.insert(r.objetos,o)
            pos=pos + string.len(a)

            if not (i==elementosDeCola) then
               -- o = {tipo="text", id= copiarTablaSimple(r.id), x=pos, y=1, altura=1, anchura=1,text="\\",color= r.color, textColor = colors.black}
                o = generarText(copiarTablaSimple(r.id),pos,1,1,1,"\\",r.color,colors.black,true)
                table.insert(o.id,idDisp)
                idDisp=idDisp+1
                table.insert(r.objetos,o)
                pos=pos + 1
            end


        end
    end
    
        
    
    return r
end
function imprimirPantalla(p)
    term.clear()

   imprimirObjetos(p.objetos,1,1)
        


end
function copiarTablaSimple(id)
    local res ={}
    for i, v in ipairs(id) do
        table.insert(res,v)
    end
    return res
end
function generarBoton(id,xRel,yRel,anchura,altura,text,funcion,color,textColor,visible) --id={}
    -- Boton = {"boton",{id},x,y,alt,anch,text,color,textColor,{funcion}}
    color= color or colors.black
    textColor= textColor or colors.white
    funcion= funcion or {""}
    text = text or ""
    if visible==nil then
        visible = true
    end
    if not anchura then
        anchura = string.len(text)
    end
    altura = altura or 1
    if anchura<1 then
        anchura=1;
    end
    
    return {tipo="boton", id=id, x=xRel, y=yRel, anchura=anchura, altura=altura, text=text, funcion=funcion, color=color, textColor=textColor, visible=visible}
    
    

end
function generarText(id,xRel,yRel,anchura,altura,text,color,textColor,visible)
    color= color or colors.black
    textColor= textColor or colors.white
    text = text or ""
    if visible==nil then
        visible = true
    end
    if not anchura then
        anchura = string.len(text)
    end
    altura = altura or 1
    if anchura<1 then
        anchura=1;
    end
    return {tipo="text", id=id, x=xRel, y=yRel, anchura=anchura, altura=altura, text=text, funcion=funcion, color=color, textColor=textColor, visible=visible}
    
end
function generaBox(id,xRel,yRel,anchura,altura,text,listObjetos,color,textColor,visible,marco)
    listObjetos= listObjetos or {}
    objetos={}
    local desMarco = 0 --descuento de espacio si hay marco
    local idDisp= 1
    if marco then
        desMarco=1
    end
    local alturaDisp = altura-desMarco*2
    local anchuraDisp = anchura-desMarco*2
    local disposicion={}
    --local segmento = generarMatriz(anchuraDisp,1,-1)
    --imprimirMatriz(generarMatriz(anchuraDisp,1,-1))
    local tD= generarMatriz(anchuraDisp,alturaDisp,-1) --Tabla De Distribucion
    --for i = 1, alturaDisp, 1 do
    --.insert(tD,segmento)
        
   -- end
    
    --imprimirMatriz(tD)
    --print("")
    local objs = {}
    for i, value in ipairs(listObjetos) do

        listObjetos[i].id=id
        table.insert(listObjetos[i].id,idDisp)
        table.insert(objetos,listObjetos[i])
        if not (listObjetos[i].x and listObjetos[i].y) then
            table.insert(objs,idDisp)
        end
        idDisp=idDisp+1
    end

    for index, v in ipairs(objs) do
        --imprimirMatriz(tD)
        if objetos[v].anchura>anchuraDisp then
            objetos[v].anchura=anchuraDisp
            
        end
        if objetos[v].altura>alturaDisp then
            objetos[v].altura=alturaDisp
        end
        local an = objetos[v].anchura
        local al= objetos[v].altura
        local nx=1
        local ny=1
        local encontrado=false
        while (not encontrado) and ny<150 do
            nx=1
            while (not encontrado) and nx<=anchuraDisp do
                encontrado=true
                for i = ny, ny + al-1, 1 do
                    if table.maxn(tD)<i+al then
                        for j = table.maxn(tD), i+al, 1 do
                            table.insert(tD,generarMatriz(anchuraDisp,1,-1))
                        end
                        
                    end 
                    
                    for n = nx, an+nx-1, 1 do
                        if not (tD[i][n]==-1 ) then
                            --print("falsito")
                            encontrado=false
                        end
                    end
                    
                end
                if not encontrado then
                    nx=nx+1
                end
                
            end
            if not encontrado then
                ny=ny+1    
            end
            
        end

        if table.maxn(tD)<=ny then
            table.insert(tD,generarMatriz(anchuraDisp,1,-1))
        end
        if encontrado then
            --print("encontrado")
            --inserta la id del objeto en la disposicion
            if ny>table.maxn(disposicion) then
                for i=table.maxn(disposicion),ny,1 do
                    table.insert(disposicion,{})
                end
            end
            table.insert(disposicion[ny],v)
            objetos[v].x=nx
            objetos[v].y=ny
            local fx= nx-1
            local fy = ny-1
            if fx<1 then
                fx=1
            end
            if fy<1 then
                fy=1
            end
            local fan=nx-fx+an+1
            local fal=ny-fy+al+1
            if fan+fx>anchuraDisp then
                fan=anchuraDisp-fx+1
            end
            --if fal+fy>alturaDisp then
            --    fal=alturaDisp-fy+1
           -- end
             
            --print(" gg")
            --print(v.." "..nx.." "..ny.." "..fan.." "..fal)
            tD= rellenarMatriz(tD,fx,fy,fan,fal,v)

           

        end
        
    end
    --imprimirMatriz(tD)
   -- imprimirMatriz(disposicion)
  -- print("")
    --print(objetos[1].x.." "..objetos[1].y.." "..objetos[1].anchura.." "..objetos[1].altura)
   -- print(objetos[2].x.." "..objetos[2].y.." "..objetos[2].anchura.." "..objetos[2].altura)
   -- print(objetos[3].x.." "..objetos[3].y.." "..objetos[3].anchura.." "..objetos[3].altura)
   -- print(objetos[4].x.." "..objetos[4].y.." "..objetos[4].anchura.." "..objetos[4].altura)
    return {tipo="box", id=id, x=xRel, y=yRel, anchura=anchura, altura=altura, text=text, funcion=funcion, color=color,indice,marcos=marco, textColor=textColor,objetos=objetos}
end

function generaTabla(id,xRel,yRel,anchura,altura,text,listObjetos,color,textColor,visible,pagina)
    listObjetos= listObjetos or {}
    objetos={}
    id = copiarTablaSimple(id)
    color= color or colors.black
    textColor= textColor or colors.white
    text = text or ""
    if visible==nil then
        visible = true
    end
    pagina = pagina or 1
    
    
    local idDisp= 4
    local alturaDisp = altura-2
    local anchuraDisp = anchura-2
    local distribucion={}
    
    table.insert(objetos,generarBoton(copiarTablaSimple(id),1,altura,2,1,"<<",{"tabla","anteriorPag",id},color,nil,false))
    table.insert(objetos[1].id,1)
    table.insert(objetos,generarText(copiarTablaSimple(id),3,altura,2,1,"10/10",color,nil,false))
    table.insert(objetos[2].id,2)
    table.insert(objetos,generarBoton(copiarTablaSimple(id),1,altura,2,1,">>",{"tabla","siguientePag",id},color,nil,false))
    table.insert(objetos[3].id,3)
   
    
    for i, value in ipairs(listObjetos) do

        listObjetos[i].id=copiarTablaSimple(id)
        table.insert(listObjetos[i].id,idDisp)
        
        table.insert(objetos,listObjetos[i])
        
        
        
        if not (listObjetos[i].x and listObjetos[i].y) then
            
            table.insert(distribucion,idDisp)
        end
        idDisp=idDisp+1
    end
    for i, v in ipairs(distribucion) do
        objetos[v].anchura = anchuraDisp
        objetos[v].x = 2
        
        if objetos[v].altura > alturaDisp then
            objetos[v].altura = alturaDisp
        end

    end

    return {
    tipo="tabla", 
    id=id, 
    x=xRel, 
    y=yRel, 
    anchura=anchura, 
    altura=altura, 
    text=text, 
    color=color,
    pagina=pagina,
    distribucion = distribucion, 
    textColor=textColor,
    objetos=objetos,
    visible=visible
}
end
function imprimirTabla(t,x0,y0)
    if t.visible then
        if t.tipo=="tabla" then
            local x = t.x + x0 -1
            local y =t.y + y0 -1
            local alturaDisp = t.altura-2
            local anchuraDisp = t.anchura-2

            local nPags=0
            local n=0
            for index, v in ipairs(t.distribucion) do
                n = n + t.objetos[v].altura
                t.objetos[v].visible=false
            end
    --llllll
            if math.floor(n/alturaDisp) == n/alturaDisp then
                nPags=n/alturaDisp
            else
                nPags = math.floor(n/alturaDisp) + 1
            end
            if t.pagina>nPags then
                t.pagina=nPags
            end
            local xn = 1
            t.objetos[1].x = y + t.altura
            t.objetos[1].x = x + xn
            xn = xn + 2 --xn = 3
            local txt = t.pagina.."/"..nPags
            
            --print("")
            --print("")
            --print(nPags)
            --print(t.pagina)
            t.objetos[2].text = txt
            t.objetos[2].x = y + t.altura
            t.objetos[2].x = x + xn
            t.objetos[2].anchura = string.len(txt)
            xn = xn + string.len(txt) 
            t.objetos[3].x = y + t.altura
            t.objetos[3].x = x + xn
            xn = xn + 2

            if nPags>1 then
                t.objetos[1].visible = true
                t.objetos[2].visible = true
                t.objetos[3].visible = true

            end
            

            local n=0
            local cuenta=0
            local indice1=1
            local indice2=1
            local nObjs = table.maxn(t.distribucion)
            for i = 1, t.pagina, 1 do
                
                while cuenta < alturaDisp and (n < nObjs) do
                    n = n+1
                    cuenta = cuenta + t.objetos[ t.distribucion[n] ].altura
                    --print(cuenta.."cuenta")
                    --if cuenta < alturaDisp and (n <= nObjs) then
                    --    n = n+1
                    --end
                    
                    --print("vuelta")
                end
                
                if cuenta > alturaDisp then
                    n = n-1
                end
                if n > nObjs then
                    n = nObjs
                end
                if i == t.pagina-1 then
                    indice1=n+1
                elseif i == t.pagina then
                    indice2=n
                end
                
                cuenta = 0
            end
            --print(indice1)
            --print(indice2)
            --print(alturaDisp  )
            local ym = 1
            if t.distribucion[1] then
                for i = indice1, indice2 , 1 do
                    t.objetos[ t.distribucion[i] ].y=ym+1 --y+ym-1
                   
                    t.objetos[ t.distribucion[i] ].visible=true
                    ym=ym +  t.objetos[ t.distribucion[i] ].altura
                    
                end
            end
            




            paintutils.drawFilledBox(x, y, x + t.anchura - 1, y + t.altura - 1, t.color)
            
            term.setBackgroundColor(colors.black)
            term.setTextColor(colors.white)
        
            imprimirObjetos(t.objetos,x,y)
        end
    end 

end
function imprimirObjetos(p,x0,y0)
    for index, value in ipairs(p) do
        local x = x0
        local y = y0
        local o = value

        if     value.tipo == "boton" then
            imprimirBoton(o,x,y)
        elseif value.tipo == "text" then
            imprimirText(o,x,y)
        elseif value.tipo == "shell" then
            imprimirShell(o,x,y)
        elseif value.tipo == "tabla" then
            imprimirTabla(o,x,y)
        end


    end
end
function imprimirShell(s,x0,y0)
   --{tipo="shell",id={},x,y,altura=1,anchura=p.anchura, color=colors.white, objeto={}}
   if s.tipo=="shell" then
    local x = s.x + x0 -1
        local y =s.y + y0 -1
    paintutils.drawFilledBox(x, y, x + s.anchura - 1, y + s.altura - 1, s.color)
    
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    

    imprimirObjetos(s.objetos,x,y)
   end 
end

function imprimirText(b,x0,y0)
    if (b.tipo=="text") then
        if b.visible then
            local x = b.x+x0-1 
            local y = b.y+y0-1 
            paintutils.drawFilledBox(x, y, x + b.anchura-1, y + b.altura-1, b.color)
            term.setTextColor(b.textColor)
            term.setBackgroundColor(b.color)
            local text = ""
            if string.len(b.text)>b.anchura  then
                text = string.sub(b.text,1,b.anchura)
            else
                text = b.text..stringDeEspacios(b.anchura - string.len(b.text))
            end
            term.setCursorPos(x,y)
            term.write(text)

            term.setBackgroundColor(colors.black)
            term.setTextColor(colors.white)
        end
    end
end

function imprimirBoton(b,x0,y0)
    x0= x0 or 1
    y0= y0 or 1
    b.x = b.x or 0
    if (b.tipo=="boton") then
        if b.visible then    
            local x = b.x+x0-1 
            local y = b.y+y0-1    
            paintutils.drawFilledBox(x, y, x + b.anchura-1, y + b.altura-1, b.color)
            term.setTextColor(b.textColor)
            term.setBackgroundColor(b.color)
            local text = ""
            if string.len(b.text)>b.anchura  then
                text = string.sub(b.text,1,b.anchura)
            else
                text = b.text..stringDeEspacios(b.anchura - string.len(b.text))
            end
            term.setCursorPos(x,y)
            term.write(text)

            term.setBackgroundColor(colors.black)
            term.setTextColor(colors.white)
        end
    end
end
function stringDeEspacios(a)
    local r = ""
    for i = 1, a, 1 do
        r=r.." "
    end
    return r
end

function generarMatriz(x,y,vacio)
    local m = {}
    local h={}
    
    for i = 1, y, 1 do
        h={}
        for n = 1, x, 1 do
        table.insert(h,vacio)
            --m[i][n]=vacio
        end
        table.insert(m,h)

    end
    return m;
end
function rellenarMatriz(m,x,y,anchura,altura,relleno)
    
    
    for i = y, y+altura-1, 1 do
        for n = x, x+anchura-1, 1 do
            
            --  print(i.." "..n)    
                m[i][n]=relleno
            
        end
    end
    return m;
end
function imprimirMatriz(m)
    
    term.setCursorPos(1,15)
    for i = 1, table.maxn(m), 1 do
        term.scroll(1)
        term.setCursorPos(1,20)
        for n =1, table.maxn(m[i]), 1 do
           term.write( m[i][n])
        end
    end
    return m;
end
function reimprimirPantalla()
    imprimirPantalla(colaDeVentanas[table.maxn(colaDeVentanas)])
end

function objetoPresionado(objeto,x,y)
    local res = nil
    local n = nil
    
    local objetos = objeto.objetos
    --print(objetos)
    
    if objetos then
        
        for i, v in ipairs(objetos) do
            --print(v.visible)
            if  v.x  and v.x  and  v.y  and v.y and v.visible then
                if  x >= v.x  and  x < v.anchura + v.x  and  y >= v.y  and  y <= v.altura + v.y-1  then
                    n = v
                   -- print(v.tipo)
                    --print(v.x)
                    --print(v.y)
                    --print(v.anchura)
                    --print(v.altura)

                
                    
                    if n.funcion  then
                        --print("true")
                        res = v
                    end
                end 
            end
            
        end
        if n then
            res = objetoPresionado(n, x + 1  -  n.x, y + 1 - n.y) or res
         end
    end
    

    return res
end
function irAnteriorVentana()
    if table.maxn(colaDeVentanas)>1 then
        local name = colaDeVentanas[table.maxn(colaDeVentanas)-1].tipo.name
        local arg = colaDeVentanas[table.maxn(colaDeVentanas)-1].tipo.arg
        table.remove(colaDeVentanas,table.maxn(colaDeVentanas))
        table.remove(colaDeVentanas,table.maxn(colaDeVentanas))
        generarPantalla( {name,arg})  
    end
end

function activarFuncion(func)
    if func then
        
        if func[1] == "xzOs" then
            if func[2]=="cerrar" then
                encendido=false
                term.clear()
                term.setCursorPos(1,1)
                os.queueEvent("pantalla","terminar")
            elseif func[2]=="irAnteriorVentana" then
                irAnteriorVentana()
                --[[if table.maxn(colaDeVentanas)>1 then
                    local name = colaDeVentanas[table.maxn(colaDeVentanas)-1].tipo.name
                    local arg = colaDeVentanas[table.maxn(colaDeVentanas)-1].tipo.arg
                    table.remove(colaDeVentanas,table.maxn(colaDeVentanas))
                    table.remove(colaDeVentanas,table.maxn(colaDeVentanas)-1)
                    generarPantalla( {name,arg})  
                end]]
                
                
            elseif func[2] =="irVentana" then
                if not (func[3] >=table.maxn(colaDeVentanas)) then
                    local name = colaDeVentanas[func[3]].tipo.name
                    local arg = colaDeVentanas[func[3]].tipo.arg
                    for i = table.maxn(colaDeVentanas), func[3], -1 do
                        table.remove(colaDeVentanas,i)
                        
                    end
                    generarPantalla({name,arg})
                end
            end
        elseif func[1] == "tabla" then
            if func[2] == "anteriorPag" then -- "tabla","anteriorPag",id
                --print("ant")
                local o = objetoPorId(func[3])
                if o.pagina>1 then
                    o.pagina = o.pagina -1
                end
                reimprimirPantalla()
            elseif func[2] == "siguientePag" then --"tabla","siguientePag",id
                --print("sig")
                local o = objetoPorId(func[3])
                o.pagina = o.pagina +1
                reimprimirPantalla()
            end
        elseif func[1]=="pantalla" then

            if func[2]=="representarTortuga" then
                generarPantalla({"tortuga",func[3]})
            end
        elseif func[1]=="tortuga" then
            if func[2]=="finalizar" then
                modem.transmit(colaDeVentanas[table.maxn(colaDeVentanas)].tipo.arg+23000,puerto,"finalizar")
            elseif func[2] == "ejecutarLava" then --"tabla","siguientePag",id
                generarPantalla({"ejecutarLava",func[3]})
            elseif func[2] == "ejecutarCavar" then --"tabla","siguientePag",id
                generarPantalla({"ejecutarCavar",func[3]})
            elseif func[2] == "ejecutarSuelificar" then --"tabla","siguientePag",id
                generarPantalla({"ejecutarSuelificar",func[3]})
            end
        end
    end 
end

function objetoPorId(id) --devuelve el objeto asociado a dicha id
    local res = nil
    if id then
       -- print("------")
       -- print(table.maxn(colaDeVentanas))
        local o 
        o = colaDeVentanas[table.maxn(colaDeVentanas)]
        local p
       -- print("o.objs: "..table.maxn(o.objetos))
        for i = 1, table.maxn(id), 1 do
            if id[i] and not (id[i]==0) then
               -- print(id[i])
                --print("id :"..id[i].." o: "..table.maxn(o.objetos).." idmax: "..table.maxn(id))
                --print(o.objetos[2].id[1])
                p = o.objetos[id[i]]
                o=p
            end
        end
        --print(o.tipo)
        res = o
    end
    return res
end
term.clear()

--imprimirBoton({tipo="boton", id=22, x=6, y=6, altura=1, anchura=16,text="holssa12" ,color= colors.orange, textColor=colors.white ,funcion={"xzOs","irVentana"}})
local pantalla = generarPantalla({"main",""})
--imprimirPantalla(pantalla)
--table.insert(colaDeVentanas,pantalla)
--term.setCursorPos(1,2)
--print("ide shell1 "..pantalla.objetos[1].objetos[1].id[1]..pantalla.objetos[1].objetos[1].id[2])
--print("ide shell2 "..pantalla.objetos[1].objetos[2].id[1]..pantalla.objetos[1].objetos[2].id[2])
--print("ide shell3 "..pantalla.objetos[1].objetos[3].id[1]..pantalla.objetos[1].objetos[3].id[2])


parallel.waitForAny(
    function()
        while encendido do
            local event, p1, p2, p3, p4, p5, p6, p7  = os.pullEvent()
        
        
            if event == "mouse_click" then -- event, button, x, y = os.pullEvent("mouse_click")
                if p1==1 then
                    local xm = p2
                    local ym = p3
                    local p=colaDeVentanas[table.maxn(colaDeVentanas)]
                   -- print(p2)
                   -- print(p3)
                    
                    local o = objetoPresionado(p,xm,ym)
                   
                    --print(o)
                    --print("---------")
                    
                    if o then
                        --print(o)
                        --print(o.tipo)
                        if o.funcion then
                            activarFuncion(o.funcion)
                        end
                        
                        
                    end
                    
                end
            end
        end 
    
    end
,
    function()
        while encendido do
            parallel.waitForAny(
                function()
                    local event, p1, p2, p3, p4, p5, p6, p7  = os.pullEvent()
                    if event == "pantalla" then
                        if p1=="main" then
                            if p2 == "iniciar" then
                                
                                while true do
                                    
                                    local botonesDeTortugas = {}
                                    local pantalla = colaDeVentanas[table.maxn(colaDeVentanas)]
                                    local tabla = colaDeVentanas[table.maxn(colaDeVentanas)].objetos[2]
                                    parallel.waitForAny(
                                        function () --envia las solicitudes de informacion
                                            term.setCursorPos(1,5)
                                            --print("preguntasndoi")
                                            for i, v in ipairs(enlaces) do
                                                modem.transmit(v+23000,puerto ,"programaEnEjecucion")
                                                sleep(0.01)
                                            end
                                            sleep(0.5)
                                            --print(colaDeVentanas[table.maxn(colaDeVentanas)][2])
                                            
                                             
                                            colaDeVentanas[table.maxn(colaDeVentanas)].objetos[2]=generaTabla(tabla.id,tabla.x,tabla.y,tabla.anchura,tabla.altura,tabla.text,botonesDeTortugas,tabla.color,tabla.textcolor,tabla.visible,1)
                                            term.clear()
                                            imprimirPantalla(colaDeVentanas[table.maxn(colaDeVentanas)])
                                            --print(table.maxn( colaDeVentanas[table.maxn(colaDeVentanas)][2].distribucion))
                                            --print(table.maxn( colaDeVentanas[table.maxn(colaDeVentanas)][2].objetos))
                                            --print(colaDeVentanas[table.maxn(colaDeVentanas)][2])
                                        end
                                    ,
                                        function () --recibe las solicitudes de informacion
                                            while true do
                                                local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                if string.sub(message,1,8)== "resprogr"then
                                                    table.insert(botonesDeTortugas,generarBoton({1},nil,nil,nil,nil,"Tortuga"..(replyChannel-23000).." a "..math.ceil(distance).." m ("..string.sub(message,9)..")",{"pantalla","representarTortuga",replyChannel-23000},colors.gray,colors.white,true))
                                                end
                                               
                                                
                                            end
                                        end
                                    )
                                end
                            end
                        elseif p1=="tortuga" then
                            if p2 == "iniciar" then
                                
                                while true do
                                    local prog = ""
                                    local objetosDeTortugas = {}
                                    local pantalla = colaDeVentanas[table.maxn(colaDeVentanas)]
                                    local tabla = colaDeVentanas[table.maxn(colaDeVentanas)].objetos[2]
                                    local tabla2 = colaDeVentanas[table.maxn(colaDeVentanas)].objetos[3]
                                    local idTortuga= pantalla.tipo.arg
                                    
                                    parallel.waitForAny(
                                        function () --envia las solicitudes de informacion
                                            term.setCursorPos(1,5)
                                            --print("preguntasndoi")
                                                table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"Tortuga "..idTortuga,colors.black,colors.white,true))
                                                table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"-----",colors.white,colors.white,true))
                                                modem.transmit(idTortuga+23000,puerto ,"fuel")
                                                modem.transmit(idTortuga+23000,puerto ,"programaEnEjecucion")
                                                modem.transmit(idTortuga+23000,puerto ,"estado")
                                                modem.transmit(idTortuga+23000,puerto ,"xRel")
                                                modem.transmit(idTortuga+23000,puerto ,"yRel")
                                                modem.transmit(idTortuga+23000,puerto ,"zRel")

                                                
                                            sleep(0.5)
                                            --print(colaDeVentanas[table.maxn(colaDeVentanas)][2])
                                            table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"-----",colors.white,colors.white,true))
                                            
                                             if prog=="escucha" then
                                                colaDeVentanas[table.maxn(colaDeVentanas)].objetos[2]=generaTabla(tabla.id,tabla.x,tabla.y,tabla.anchura,8,tabla.text,objetosDeTortugas,tabla.color,tabla.textcolor,tabla.visible,tabla.pagina)
                                               -- colaDeVentanas[table.maxn(colaDeVentanas)].objetos[2]=generaTabla(tabla2.id,tabla2.x,tabla2.y,tabla2.anchura,7,tabla2.text,tabla2.distribucion,tabla2.color,tabla2.textcolor,true,tabla2.pagina)
                                                tabla2.visible=true
                                             else
                                                colaDeVentanas[table.maxn(colaDeVentanas)].objetos[2]=generaTabla(tabla.id,tabla.x,tabla.y,tabla.anchura,16,tabla.text,objetosDeTortugas,tabla.color,tabla.textcolor,tabla.visible,tabla.pagina)
                                                --colaDeVentanas[table.maxn(colaDeVentanas)].objetos[2]=generaTabla(tabla2.id,tabla2.x,tabla2.y,tabla2.anchura,7,tabla2.text,tabla2.distribucion,tabla2.color,tabla2.textcolor,false,tabla2.pagina)
                                                tabla2.visible=false

                                             end
                                            term.clear()
                                            imprimirPantalla(colaDeVentanas[table.maxn(colaDeVentanas)])
                                            --print(table.maxn( colaDeVentanas[table.maxn(colaDeVentanas)][2].distribucion))
                                            --print(table.maxn( colaDeVentanas[table.maxn(colaDeVentanas)][2].objetos))
                                            --print(colaDeVentanas[table.maxn(colaDeVentanas)][2])
                                        end
                                    ,
                                        function () --recibe las solicitudes de informacion
                                            while true do
                                                local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                if string.sub(message,1,8)== "resfuel_" then
                                                    
                                                    local fuel = tonumber( string.sub(message,9) )
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"Fuel: "..fuel,colors.white,colors.black,true))
                                                elseif string.sub(message,1,8)== "resprogr" then
                                                     prog = string.sub(message,9) 
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"Programa: "..prog,colors.white,colors.black,true))
                                                elseif string.sub(message,1,8)== "resestad" then
                                                    local estado = string.sub(message,9)
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"Estado: "..estado,colors.white,colors.black,true))
                                                elseif string.sub(message,1,8)== "resxrel_" then
                                                    local res = string.sub(message,9)
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"xRel: "..res,colors.white,colors.black,true))
                                                elseif string.sub(message,1,8)== "resyrel_" then
                                                    local res = string.sub(message,9)
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"yRel: "..res,colors.white,colors.black,true))
                                                elseif string.sub(message,1,8)== "reszrel_" then
                                                    local res = string.sub(message,9)
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"zRel: "..res,colors.white,colors.black,true))
                                                elseif string.sub(message,1,8)== "resfinal" then
                                                    local estado = string.sub(message,9)
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,estado,colors.red,colors.white,true))
                                                
                                                end
                                                
                                            end
                                        end
                                    )
                                end

                            end
                        elseif p1=="ejecutarLava" then
                            if p2 == "iniciar" then
                                
                                while true do
                                    local prog = ""
                                    local posX = 3
                                    local posY = 1
                                    local objetosDeTortugas = {}
                                    local pantalla = colaDeVentanas[table.maxn(colaDeVentanas)]
                                    --local tabla = colaDeVentanas[table.maxn(colaDeVentanas)].objetos[2]
                                    --local tabla2 = colaDeVentanas[table.maxn(colaDeVentanas)].objetos[3]
                                    local idTortuga= pantalla.tipo.arg
                                    
                                    parallel.waitForAny(
                                        function () --envia las solicitudes de informacion
                                            term.setCursorPos(1,3)
                                            --print("preguntasndoi")
                                                local res
                                                modem.transmit(idTortuga+23000,puerto ,"ejecutarLava")
                                                
                                                while not (res == "largura"  ) do
                                                    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                    res=message
                                                end
                                                
                                                term.write("Largura ? : ")
                                                modem.transmit(idTortuga+23000,puerto,"reslargu"..read())
                                                
                                                while not (res == "anchura"  ) do
                                                    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                    res=message
                                                end
                                                term.write("Anchura ? : ")
                                                
                                                modem.transmit(idTortuga+23000,puerto,"resanchu"..read())
                                                while not (res == "altura"  ) do
                                                    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                    res=message
                                                end
                                                term.write("Altura ? : ")
                                                modem.transmit(idTortuga+23000,puerto,"resaltur"..read())
                                                
                                                

                                                print("")
                                                term.setBackgroundColor(colors.green)
                                                term.setTextColor(colors.white)
                                                print("HECHO")
                                            sleep(0.7)
                                            --print(colaDeVentanas[table.maxn(colaDeVentanas)][2])

                                            
                                            term.setBackgroundColor(colors.black)
                                            term.setTextColor(colors.white)
                                            term.clear()
                                            irAnteriorVentana()
                                            
                                            --imprimirPantalla(colaDeVentanas[table.maxn(colaDeVentanas)])
                                            --print(table.maxn( colaDeVentanas[table.maxn(colaDeVentanas)][2].distribucion))
                                            --print(table.maxn( colaDeVentanas[table.maxn(colaDeVentanas)][2].objetos))
                                            --print(colaDeVentanas[table.maxn(colaDeVentanas)][2])
                                        end
                                    ,
                                        function () --recibe las solicitudes de informacion
                                            while true do
                                                local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                if string.sub(message,1,8)== "resfuel_" then
                                                    
                                                    local fuel = tonumber( string.sub(message,9) )
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"Fuel: "..fuel,colors.white,colors.black,true))
                                                elseif string.sub(message,1,8)== "resprogr" then
                                                        prog = string.sub(message,9) 
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"Programa: "..prog,colors.white,colors.black,true))
                                                
                                                
                                                end
                                                
                                            end
                                        end
                                    )
                                end
                            end
                        elseif p1=="ejecutarCavar" then
                            if p2 == "iniciar" then
                                
                                while true do
                                    local prog = ""
                                    local posX = 3
                                    local posY = 1
                                    local objetosDeTortugas = {}
                                    local pantalla = colaDeVentanas[table.maxn(colaDeVentanas)]
                                    --local tabla = colaDeVentanas[table.maxn(colaDeVentanas)].objetos[2]
                                    --local tabla2 = colaDeVentanas[table.maxn(colaDeVentanas)].objetos[3]
                                    local idTortuga= pantalla.tipo.arg
                                    
                                    parallel.waitForAny(
                                        function () --envia las solicitudes de informacion
                                            term.setCursorPos(1,3)
                                            --print("preguntasndoi")
                                                local res
                                                modem.transmit(idTortuga+23000,puerto ,"ejecutarCavar")
                                                
                                                while not (res == "largura"  ) do
                                                    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                    res=message
                                                end
                                                
                                                term.write("Largura ? : ")
                                                modem.transmit(idTortuga+23000,puerto,"reslargu"..read())
                                                
                                                while not (res == "anchura"  ) do
                                                    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                    res=message
                                                end
                                                term.write("Anchura ? : ")
                                                
                                                modem.transmit(idTortuga+23000,puerto,"resanchu"..read())
                                                while not (res == "altura"  ) do
                                                    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                    res=message
                                                end
                                                term.write("Altura ? : ")
                                                modem.transmit(idTortuga+23000,puerto,"resaltur"..read())
                                                
                                                

                                                print("")
                                                term.setBackgroundColor(colors.green)
                                                term.setTextColor(colors.white)
                                                print("HECHO")
                                            sleep(0.7)
                                            --print(colaDeVentanas[table.maxn(colaDeVentanas)][2])

                                            
                                            term.setBackgroundColor(colors.black)
                                            term.setTextColor(colors.white)
                                            term.clear()
                                            irAnteriorVentana()
                                            
                                            --imprimirPantalla(colaDeVentanas[table.maxn(colaDeVentanas)])
                                            --print(table.maxn( colaDeVentanas[table.maxn(colaDeVentanas)][2].distribucion))
                                            --print(table.maxn( colaDeVentanas[table.maxn(colaDeVentanas)][2].objetos))
                                            --print(colaDeVentanas[table.maxn(colaDeVentanas)][2])
                                        end
                                    ,
                                        function () --recibe las solicitudes de informacion
                                            while true do
                                                local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                if string.sub(message,1,8)== "resfuel_" then
                                                    
                                                    local fuel = tonumber( string.sub(message,9) )
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"Fuel: "..fuel,colors.white,colors.black,true))
                                                elseif string.sub(message,1,8)== "resprogr" then
                                                        prog = string.sub(message,9) 
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"Programa: "..prog,colors.white,colors.black,true))
                                                
                                                
                                                end
                                                
                                            end
                                        end
                                    )
                                end
                            end
                        elseif p1=="ejecutarSuelificar" then
                            if p2 == "iniciar" then
                                
                                while true do
                                    local prog = ""
                                    local posX = 3
                                    local posY = 1
                                    local objetosDeTortugas = {}
                                    local pantalla = colaDeVentanas[table.maxn(colaDeVentanas)]
                                    --local tabla = colaDeVentanas[table.maxn(colaDeVentanas)].objetos[2]
                                    --local tabla2 = colaDeVentanas[table.maxn(colaDeVentanas)].objetos[3]
                                    local idTortuga= pantalla.tipo.arg
                                    
                                    parallel.waitForAny(
                                        function () --envia las solicitudes de informacion
                                            term.setCursorPos(1,3)
                                            --print("preguntasndoi")
                                                local res
                                                modem.transmit(idTortuga+23000,puerto ,"ejecutarSuelificar")
                                                
                                                while not (res == "largura"  ) do
                                                    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                    res=message
                                                end
                                                
                                                term.write("Largura ? : ")
                                                modem.transmit(idTortuga+23000,puerto,"reslargu"..read())
                                                
                                                while not (res == "anchura"  ) do
                                                    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                    res=message
                                                end
                                                term.write("Anchura ? : ")
                                                
                                                modem.transmit(idTortuga+23000,puerto,"resanchu"..read())
                                                
                                                
                                                

                                                print("")
                                                term.setBackgroundColor(colors.green)
                                                term.setTextColor(colors.white)
                                                print("HECHO")
                                            sleep(0.7)
                                            --print(colaDeVentanas[table.maxn(colaDeVentanas)][2])

                                            
                                            term.setBackgroundColor(colors.black)
                                            term.setTextColor(colors.white)
                                            term.clear()
                                            irAnteriorVentana()
                                            
                                            --imprimirPantalla(colaDeVentanas[table.maxn(colaDeVentanas)])
                                            --print(table.maxn( colaDeVentanas[table.maxn(colaDeVentanas)][2].distribucion))
                                            --print(table.maxn( colaDeVentanas[table.maxn(colaDeVentanas)][2].objetos))
                                            --print(colaDeVentanas[table.maxn(colaDeVentanas)][2])
                                        end
                                    ,
                                        function () --recibe las solicitudes de informacion
                                            while true do
                                                local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
                                                if string.sub(message,1,8)== "resfuel_" then
                                                    
                                                    local fuel = tonumber( string.sub(message,9) )
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"Fuel: "..fuel,colors.white,colors.black,true))
                                                elseif string.sub(message,1,8)== "resprogr" then
                                                        prog = string.sub(message,9) 
                                                    table.insert(objetosDeTortugas,generarText({1},nil,nil,nil,nil,"Programa: "..prog,colors.white,colors.black,true))
                                                
                                                
                                                end
                                                
                                            end
                                        end
                                    )
                                end
                            end
                        
                        end

                      
                    end
                end
                ,
                function()
                    local event, p1, p2, p3, p4, p5, p6, p7  = os.pullEvent()
                    while not (event=="pantalla" and p1=="terminar")   do
                         event, p1, p2, p3, p4, p5, p6, p7  = os.pullEvent()
                    end
                    term.setCursorPos(1,19)
                    
                    --if table.maxn(colaDeVentanas)<=1 then
                    --    encendido=false
                    --end
                end    
            )

            


            
        end
            
    end


)



--generaBox({4},1,1,10,10,"",{
---    generarBoton({1}, nil, nil, 5, 2, "ssssa<", {"xzOs","irAnteriorVentana"}, colors.orange, colors.white),
 --   generarBoton({1}, nil, nil, 6, 2, "<ddddddd", {"xzOs","irAnteriorVentana"}, colors.orange, colors.white),
 --   generarBoton({1}, nil, nil, 6 , 2, "casa", {"xzOs","irAnteriorVentana"}, colors.orange, colors.white),
---    generarBoton({1}, nil, nil, 3 , 2, "casa", {"xzOs","irAnteriorVentana"}, colors.orange, colors.white)

--},"","",true,true)
--imprimirMatriz(rellenarMatriz(generarMatriz(10,10,1),1,1,5,7,0))
