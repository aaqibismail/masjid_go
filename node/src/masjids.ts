import {Request, Response} from 'express';
import {validationResult} from 'express-validator';
import {client} from './index';

export async function masjids(req: Request, res: Response) {
  if (!validationResult(req).isEmpty()) {
    return res.sendStatus(400);
  }

  try {
    const origin = req.body.origin as string;
    const masjids = req.body.masjids as string[];
    const result = await _masjids(origin, masjids);
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

async function _masjids(origin: string, masjids: string[]) {
  const value = await client.distancematrix({
    params: {
      origins: [origin],
      destinations: masjids,
      // departure_time: 'now',
      key: process.env.GOOGLE_MAPS_WEB_SERVER_DEV!,
    },
  });
  return value.data;
}
