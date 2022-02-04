function init() {

    const cookies = document.cookie.split('=');
    const token = cookies[cookies.length - 1];


    fetch('http://127.0.0.1:8081/listKursevi', {
        headers: {
            'Authorization': `Bearer ${token}`
        }
    })
        .then( res => res.json() )
        .then( data => {
            const tabela = document.getElementById('tabela');

            for(i=0;i<data.length;i++){
                tabela.innerHTML += `<tr> <tr> <td> <button type='button'  class='btn btn-default'>
                <span class='glyphicon glyphicon-edit' />
                </button></td> <td> ${data[i].naziv} </td> <td>${data[i].trajanje} </td> <td> ${data[i].uslov_polaganja} </td> <td>
                <button type='button' 
                         onclick= productDelete(this)
                         class='btn btn-default'>
                <span class='glyphicon glyphicon-remove' />
                </button> </tr>`;
            }
          
        });
        document.getElementById('btn').addEventListener('click', e => {

            window.location.href = '/admin/addKurs';
        });

}