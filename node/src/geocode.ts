'use strict';
import axios from 'axios';
import {Request, Response} from 'express';
import {validationResult} from 'express-validator';

export async function geocode(req: Request, res: Response) {
  if (!validationResult(req).isEmpty()) {
    return res.sendStatus(400);
  }

  try {
    const lat = req.query.lat as string;
    const lng = req.query.lng as string;

    const result = await _geocode(lat, lng);
    if (result.status === 200) {
      return res.status(200).json(result.data);
    }
    return res.sendStatus(404);
  } catch (error) {
    console.error('Unknown Error');
    console.error(error);
    return res.sendStatus(500);
  }
}

async function _geocode(lat: string, lng: string) {
  const url = 'https://us1.locationiq.com/v1/reverse.php';

  return axios.get(url, {
    params: {
      format: 'json',
      lat: lat,
      lon: lng,
      key: process.env.LOCATION_IQ_KEY,
    },
  });
}
