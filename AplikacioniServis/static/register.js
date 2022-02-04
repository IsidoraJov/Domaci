function init() {
    const cookies = document.cookie.split('=');
    const token = cookies[cookies.length - 1];

    document.getElementById('btn').addEventListener('click', e => {
        e.preventDefault();

        const data = {
            username: document.getElementById('username').value,
            email: document.getElementById('email').value,
            password: document.getElementById('password').value,
            broj_telefona: document.getElementById('br_telefona').value,
            steceno_obrazovanje: document.getElementById('steceno_obrazovanje').value,
            id_radno_mesto: 1,
            id_rola:3

        };
       
        fetch('http://127.0.0.1:8081/addUser', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json',
                        'Authorization': `Bearer ${token}`},
            body: JSON.stringify(data)
        })
            .then( res => res.json() )
            window.location.href = '/home';
    });
}