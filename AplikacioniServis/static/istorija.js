function init() {

    const cookies = document.cookie.split('=');
    const token = cookies[cookies.length - 1];


    fetch('http://127.0.0.1:8081/listIstorijaPolaganja', {
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
                </button></td> <td> ${data[i].id_kursa} </td> <td>${data[i].id_usera} </td> <td> ${data[i].ocena} </td> <td> ${data[i].zavrsen} </td>  <td>
                <button type='button' 
                         onclick= productDelete(this)
                         class='btn btn-default'>
                <span class='glyphicon glyphicon-remove' />
                </button></tr>`;
            }
          
        });

        document.getElementById('btn').addEventListener('click', e => {

            window.location.href = '/admin/addIstorijaPolaganja';
        });


}