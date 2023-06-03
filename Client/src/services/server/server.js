export default class Server {
    constructor(token) {
        this.token = token || null;

    }

    async send(params = {}) {
        if (this.token) {
            params.token = this.token;
        }
        const query = Object.keys(params).map(key =>
            `${key}=${params[key]}`
        ).join("&");
        const responce = await fetch(`http://coursework/server/api/?${query}`);
        const answer = await responce.json();
        return answer?.result === 'ok' ? answer?.data : null;
    }

    async postSend(params = {}) {
        if (this.token) {
            params.token = this.token;
        }
        const responce = await fetch(`http://coursework/server/api/?method=${params['method']}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(params)
        });
        const answer = await responce.json();
        return answer?.result === 'ok' ? answer?.data : null;
    }

    ////////////////////////USER///////////////////////////////

    async login(login, password) {
        if(login && password) {
            const data = await this.send({ 
                method: 'login', 
                login, password 
            });
            if(data?.token) {
                this.token = data.token;
                localStorage.setItem('token', this.token);
                delete data.token;
                return data;
            } else {
                return null;
            }
        }
    }

    async logout() {
        await this.send({ 
            method: 'logout', 
            token : this.token 
        });
        if(this.token) {
            localStorage.removeItem('token');
            this.token = null;
            return true;
        }
    }

    async registration(name, login, password) {
        return await this.send({ 
            method: 'registration', 
            name, 
            login, 
            password 
        });
    }

    async getLoggedUsers() {
        return await this.send({ method: 'getLoggedUsers' });
    }
}