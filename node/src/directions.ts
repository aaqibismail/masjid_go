import {Request, Response} from 'express';
import {validationResult} from 'express-validator';
import {client} from './index';

export async function directions(req: Request, res: Response) {
  if (!validationResult(req).isEmpty()) {
    return res.sendStatus(400);
  }

  try {
    const origin = req.query.origin as string;
    const destination = req.query.destination as string;
    const result = await _directions(origin, destination);
    if (result.status === 'OK') {
      return res.status(200).json(result);
    }
    return res.sendStatus(404);
  } catch (error) {
    console.error('Unknown Error');
    console.error(error);
    return res.sendStatus(500);
  }
}

async function _directions(origin: string, destination: string) {
  // Origin and destination can be either latlng or place_id
  // Decided by client
  const value = await client.directions({
    params: {
      alternatives: true,
      origin: origin,
      destination: destination,
      key: process.env.GOOGLE_MAPS_WEB_SERVER_DEV!,
    },
  });
  return value.data;
}
