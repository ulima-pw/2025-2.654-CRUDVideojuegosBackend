import express, {Request, Response} from "express"
import dotenv from "dotenv"
import cors from "cors"
import bodyParser from "body-parser"
import dataVideojuegos, { Videojuego } from "./data"
import { PrismaClient } from "./generated/prisma"
import { PrismaClientKnownRequestError } from "./generated/prisma/runtime/library"

dotenv.config()
const app = express()
const PORT = process.env.PORT

app.use(cors()) // Configurando CORS (abierto)
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended : true
}))


// Endpoint GET para obtener videojuegos
app.get("/videojuegos", async (req : Request, resp : Response) => {
    const prisma = new PrismaClient()

    // Obtenemos los videojuegos de la base de datos
    const videojuegos = await prisma.videojuego.findMany({
        omit : {
            categoria_id : true
        },
        include : {
            categoria : true,
            plataformas : true
        }
    })

    resp.status(200).json(videojuegos)
})

// Endpoint GET para eliminar un videojuego
// http://localhost:5002/videojuegos/eliminar?id=1
app.get("/videojuegos/eliminar", async (req : Request, resp : Response) => {
    const id = req.query.id

    if (id == undefined) {
        resp.status(400).json({
            error : "Debe enviar un id como query parameter"
        })
        return
    }

    const prisma = new PrismaClient()

    try {
        await prisma.videojuego.delete({
            where : {
                id : id.toString()
            }
        })
        resp.status(200).json("")
        return
    }catch (e) {
        const dataError = e as PrismaClientKnownRequestError
        resp.status(400).json({
            error : dataError.meta!.cause
        })
    }
    
})

// Endpoint GET para obtener data de un videojuego
// http://localhost:5002/videojuego/2
app.get("/videojuegos/:id", async (req : Request, resp : Response) => {
    const id = req.params.id

    if (id == undefined) {
        resp.status(400).json({
            error : "No ha enviado id."
        })
        return
    }

    const prisma = new PrismaClient()

    try {
        const videojuego = await prisma.videojuego.findFirstOrThrow({
            where : {
                id : id
            }
        })
        resp.status(200).json(videojuego)
        return
    }catch(e) {
        const dataError = e as PrismaClientKnownRequestError
        resp.status(400).json({
            error : dataError.meta!.cause
        })
    }
})

// Endpoint POST para registrar un videojuego
app.post("/videojuegos/crear", async (req : Request, resp : Response) => {
    const data = req.body
    const prisma = new PrismaClient()

    const videojuego = await prisma.videojuego.create({
        data : {
            nombre : data.nombre,
            estado : data.estado,
            categoria_id : data.categoria_id,
            plataformas : {
                connect : data.plataformas
            }
        }
    })
    resp.status(200).json(videojuego)
})

// Endpoint POST para modificar un videojuego
app.post("/videojuegos/actualizar", async (req : Request, resp : Response) => {
    const data = req.body
    const id = data.id

    const prisma = new PrismaClient()

    try {
        const videojuegoActualizado = await prisma.videojuego.update({
            where : {
                id : id
            },
            data : {
                nombre : data.nombre,
                fecha : data.fecha == undefined ? new Date() : new Date(data.fecha),
                estado : data.estado,
                categoria_id : data.categoria_id,
                plataformas : {
                    connect : data.plataformas
                }
            }
        })
        resp.status(200).json(videojuegoActualizado)
        return
    }catch(e) {
        const dataError = e as PrismaClientKnownRequestError
        resp.status(400).json({
            error : dataError.meta!.cause
        })
    }
})

app.get("/categorias", async (req : Request, resp : Response) => {
    const prisma = new PrismaClient()

    const categorias = await prisma.categoria.findMany()

    resp.status(200).json(categorias)
})

app.get("/plataformas", async (req : Request, resp : Response) => {
    const prisma = new PrismaClient()

    const plataformas = await prisma.plataforma.findMany()

    resp.status(200).json(plataformas)
})



app.listen(PORT, () => {
    console.log(`Servidor iniciado en puerto ${PORT}`)
})