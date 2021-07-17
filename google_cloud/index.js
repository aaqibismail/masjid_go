const express = require('express');
const axios = require('axios').default;

const app = express();

app.get('/directions', (req, res) => {
    res.set("Access-Control-Allow-Origin", "*");
    res.set("Access-Control-Allow-Methods", "GET");
    res.set("Access-Control-Allow-Headers", "*");

    // cache preflight response for 3600 sec
    res.set("Access-Control-Max-Age", "3600");
    let origin = req.query.origin;
    let destination = req.query.destination;
    if (!origin || !destination) {
        return res.sendStatus(400);
    } else {
        return directions(origin, destination)
            .then((result) => {
                console.log(result.data)
                if (result.data.status == "OK") {
                    return res.status(200).send(JSON.stringify(result.data));
                } else {
                    console.error("API ERROR");
                    return res.sendStatus(404);
                }
            })
            .catch((error) => {
                console.error("OTHER ERROR");
                console.error(error);
                return res.sendStatus(404);
            });
    }

});

const directions = async (origin, destination) => {
    const url = "https://maps.googleapis.com/maps/api/directions/json";

    return axios.get(url, {
        params: {
            origin: `place_id:${origin}`,
            destination: `place_id:${destination}`,
            alternatives: true,
            key: process.env.GOOGLE_MAPS_WEB
        }
    })
        .then(function (response) {
            return response;
        })
}