import express, { Request, Response } from 'express';
import bodyParser from 'body-parser';
import { Controller } from './controller';

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

const controller = new Controller();

app.route('/ping').get(controller.pong);
app.route('/pong').get(controller.ping);
app.route('/professional-ping-pong').get(controller.pro);
app.route('/amateur-ping-pong').get(controller.amateur);
app.route('/chance-ping-pong').get(controller.chance);
app.route('/').get(controller.pong);

app.listen(port, () => {
    console.log(`Listening on PORT: ${port}`);
});
