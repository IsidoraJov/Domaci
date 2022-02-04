function init() {

    const cookies = document.cookie.split('=');
    const token = cookies[cookies.length - 1];

    function productDelete(e) {

    }

    fetch('http://127.0.0.1:8081/listRadnaMesta', {
        headers: {
            'Authorization': `Bearer ${token}`
        }
    })
        .then(res => res.json())
        .then(data => {
            const tabela = document.getElementById('tabela');

            for (i = 0; i < data.length; i++) {
                tabela.innerHTML += `<tr> <tr> <td> <button type='button'  class='btn btn-default'>
                <span class='glyphicon glyphicon-edit' />
                </button></td> <td> ${data[i].naziv} </td> <td>${data[i].opis} </td> <td>
                <button type='button' 
                         class='btn btn-default DeleteBtn'>
                <span class='glyphicon glyphicon-remove' />
                </button> </tr>`;
            }

        });


        
    /*const tbody = document.querySelector('table');

    function onDeleteRow(e) {
        if (!e.target.classList.contains("DeleteBtn")) {
            return;
        }
        fetch('http://127.0.0.1:8080/deleteRadnoMesto/:id', {
            method: 'DELETE',
            headers: { 'Content-Type': 'application/json',
                        'Authorization': `Bearer ${token}`}
           
        })
            .then( res => res.json() )
            window.location.href = '/admin/radnaMesta';
});
            

    }*/

    tbody.addEventListener('click', onDeleteRow);


    document.getElementById('btn').addEventListener('click', e => {

        window.location.href = '/admin/addRadnoMesto';
    });
}