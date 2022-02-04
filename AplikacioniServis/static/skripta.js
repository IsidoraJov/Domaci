function init() {

    const cookies = document.cookie.split('=');
    const token = cookies[cookies.length - 1];
    

    fetch('http://127.0.0.1:8081/listUsers', {
        headers: {
            'Authorization': `Bearer ${token}`
        }
    })
        .then( res => res.json() )
        .then( data => {
            const tabela = document.getElementById('tabela');

            for(i=0;i<data.length;i++){


                tabela.innerHTML += `<tr> <td> <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-edit" />
                </button></td> <td> ${data[i].username} </td> <td>${data[i].email} </td> <td> ${data[i].steceno_obrazovanje} </td> <td> ${data[i].radno_mesto} </td> 
                <td><button type="button" 
                       
                         class="btn btn-default">
                <span class="glyphicon glyphicon-remove" />
                </button> </td> </tr>`;

        
            }
        
        });
         
       
        document.getElementById('btn').addEventListener('click', e => {
        
            window.location.href = '/admin/addUser';
                  
        });


    document.getElementById('logout').addEventListener('click', e => {
        document.cookie = `token=;SameSite=Lax`;
        window.location.href = 'login.html';
    });
}