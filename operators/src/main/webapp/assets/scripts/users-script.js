$(document).ready(function () {
    new DataTable('#datatable-users', {
        columnDefs: [
            {
                orderable: false,
                render: DataTable.render.select(),
                targets: 0
            }
        ],
        fixedColumns: {
            start: 2
        },
        //order: [[1, 'asc']],
        paging: false,
        //scrollCollapse: false,
        //scrollX: false,
        //scrollY: 300,
        select: {
            //style: 'os',
            selector: 'td:first-child'
        }
    }); 
});




