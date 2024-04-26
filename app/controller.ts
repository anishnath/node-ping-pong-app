import { Request, Response } from 'express';

export class Controller {
    pong(req: Request, res: Response): void {
        res.json('pong');
    }

    ping(req: Request, res: Response): void {
        res.json('ping');
    }

    pro(req: Request, res: Response): void {
        const success = Math.random();
        if (success <= 0.90) {
            res.json('pong');
        } else {
            res.status(400).send('The Pro has failed');
        }
    }

    amateur(req: Request, res: Response): void {
        const success = Math.random();
        if (success <= 0.70) {
            res.json('pong');
        } else {
            res.status(400).send('The Amateur has failed');
        }
    }

    chance(req: Request, res: Response): void {
        const success = Math.random();
        if (success <= 0.50) {
            res.json('ping');
        } else {
            res.json('pong');
        }
    }
}
