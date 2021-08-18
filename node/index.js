'use strict';

const {Client} = require('@googlemaps/google-maps-services-js');
const axios = require('axios').default;
require('dotenv').config();

const client = new Client({});

exports.main = async (req, res) => {
  try {
    const origin = req.query.origin;
    const destination = req.query.destination;
    // Comma-separated array of latlng
    // ["1,2", "3,4"]
    const locs = req.body.locs;
    const lat = req.query.lat;
    const lng = req.query.lng;

    if (lat && lng) {
      const result = await geocode(lat, lng);
      return res.status(200).send(JSON.stringify(result));
    } else if (origin && destination) {
      const result = await directions(origin, destination);
      if (result.status === 'OK') {
        return res.status(200).send(JSON.stringify(result));
      }
    } else if (locs) {
      const promises = locs.map(loc => masjids(loc));
      const results = await Promise.all(promises);
      console.log(results);
      const okResults = results.filter(result => result.status === 'OK');

      const data = {};
      for (const result of okResults) {
        for (const item of result.results) {
          if (item.place_id) {
            data[item.place_id] = item;
          }
        }
      }
      return res.status(200).send(JSON.stringify(data));
    } else {
      return res.sendStatus(400);
    }

    console.error('API ERROR');
    return res.sendStatus(404);
  } catch (error) {
    console.error('Unknown Error');
    console.error(error);
    return res.sendStatus(500);
  }
};

const directions = async (origin, destination) => {
  // Origin and destination can be either latlng or place_id
  // Decided by client
  return client
    .directions({
      params: {
        alternatives: true,
        origin: origin,
        destination: destination,
        key: process.env.GOOGLE_MAPS_WEB_SERVER_DEV,
      },
    })
    .then(value => value.data);
};

const masjids = async loc => {
  // All mosques within 30000 meters or 18.6 miles
  return client
    .placesNearby({
      params: {
        keyword: 'mosques',
        key: process.env.GOOGLE_MAPS_WEB_SERVER_DEV,
        location: loc,
        radius: 30000,
      },
    })
    .then(value => value.data);
};

const geocode = async (lat, lng) => {
  const url = 'https://us1.locationiq.com/v1/reverse.php';

  return axios.get(url, {
    params: {
      format: 'json',
      lat: lat,
      lon: lng,
      key: process.env.LOCATION_IQ_KEY,
    },
  });
};
