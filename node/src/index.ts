'use strict';
import {Client} from '@googlemaps/google-maps-services-js';
import {config} from 'dotenv';
import {query, body} from 'express-validator';
import * as express from 'express';
import * as compression from 'compression';
import {geocode} from './geocode';
import {directions} from './directions';
import {masjids} from './masjids';

const app = express();
app.use(compression());
config();

exports.main = app;
export const client = new Client({});

app.use(
  '/directions',
  query('origin')
    .exists({
      checkFalsy: true,
      checkNull: true,
    })
    .isString(),
  query('destination')
    .exists({
      checkFalsy: true,
      checkNull: true,
    })
    .isString(),
  directions
);

app.use(
  '/geocode',
  query('lat')
    .exists({
      checkFalsy: true,
      checkNull: true,
    })
    .isString(),
  query('lng')
    .exists({
      checkFalsy: true,
      checkNull: true,
    })
    .isString(),
  geocode
);

app.use(
  '/masjids',
  body('origin').exists({checkNull: true}).isString(),
  body('masjids').exists({checkNull: true}).isArray(),
  masjids
);
