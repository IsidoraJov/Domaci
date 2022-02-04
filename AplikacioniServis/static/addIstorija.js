function init() {
    
    const cookies = document.cookie.split('=');
    const token = cookies[cookies.length - 1];

    document.getElementById('btn').addEventListener('click', e => {
        e.preventDefault();

                const data = {
                    id_kursa: document.getElementById('id_kursa').value,
                    id_usera: document.getElementById('id_usera').value,
                    ocena: document.getElementById('ocena').value,
                    zavrsen: document.getElementById('zavrsen').value
                };
                    
               

                fetch('http://127.0.0.1:8081/addIstorijaPolaganja', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json',
                                'Authorization': `Bearer ${token}`},
                    body: JSON.stringify(data)
                })
                    .then( res => res.json() )
                    window.location.href = '/admin/istorijaPolaganja';
    });



}