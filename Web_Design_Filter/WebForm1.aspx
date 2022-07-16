<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Web_Design_Filter.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Basic Filter</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">


    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="JS/jbvalidator.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.6.0/umd/popper.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.5/datatables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <style>
            .container-xl, .container-xxl {
                max-width: 1500px;
            }

            .Patten_Filter_UI_LI {
                margin: 20px;
                position: relative;
                background-color: #E5E5E5;
                border-radius: 5px;
                list-style-type: none;
                padding: 10px;
                padding-right: 24px;
                margin-bottom: 60px;
            }

                .Patten_Filter_UI_LI .icon_Add,
                .Patten_Filter .icon_Add {
                    font-size: 18px;
                    display: inline-flex;
                    align-items: center;
                }

                .Patten_Filter_UI_LI .bt_Add,
                .Patten_Filter .bt_Add {
                    max-height: 2.5rem;
                    min-width: 6rem;
                    border-radius: 10px;
                    align-items: center;
                    display: inline-flex;
                }

                .Patten_Filter_UI_LI input,
                .Patten_Filter input {
                    border-radius: 10px;
                    box-shadow: 0 6px 10px 0 rgb(214 214 214) !important
                }

                .Patten_Filter_UI_LI .form-select,
                .Patten_Filter .form-select {
                    border-radius: 10px;
                    box-shadow: 0 6px 10px 0 rgb(214 214 214) !important
                }

                .Patten_Filter_UI_LI .bt_Xcircle,
                .Patten_Filter .bt_Xcircle {
                    background: none;
                    border: 10px;
                }

            .Patten_Filter_Type_ADD {
                max-height: 2.5rem;
                width: 6rem;
                border-radius: 10px;
                align-items: center;
            }

            .Div_Patten_Filter_Type_ADD {
                margin-bottom: -50px;
                vertical-align: bottom;
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                text-align: center;
            }

            .toggle {
                border-radius: 10px;
            }

            .btn_Filter_Trash {
                width: 3rem;
                border-radius: 50%;
                border: none !important;
                text-align: center;
                background-color: #DC3545;
                height: 3rem;
            }

                .btn_Filter_Trash .icon_Filter_Trash {
                    font-size: 25px;
                }

            .Div_Patten_Filter_Type_trash {
                position: absolute;
                top: 0;
                right: 0;
                margin-right: -23px;
            }

            .btn_Type_Trash {
                width: 10rem;
                border-radius: 10px;
                border: none !important;
                text-align: center;
                background-color: #DC3545;
                height: 3rem;
            }

                .btn_Type_Trash .icon_Type_Trash {
                    font-size: 25px;
                }

                    .btn_Type_Trash .icon_Type_Trash .label_Type_Trash {
                        font-size: 25px;
                        font-style: initial;
                        color: white;
                    }
        </style>
        <script>
            let validator;
            $(document).ready(function () {
                var kk = GenTable_Frist();

                validator = $('.needs-validation').jbvalidator({
                    errorMessage: true,
                    successClass: false,
                    html5BrowserDefault: false

                });



            });
            function GenTable_Frist() {

                var Type_filer;
                $.ajax({
                    url: 'WebForm1.aspx/Datainput_',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8"',
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        var select_ = document.createElement('select');
                        select_.id = 'Type_Select'
                        select_.className = 'form-select'

                        select_.style = 'border-radius: 10px; box-shadow: 0 6px 10px 0 rgb(214 214 214)!important;';



                        var option_Placeholder_Frist = document.createElement('option')
                        option_Placeholder_Frist.text = 'Select Saction type';
                        option_Placeholder_Frist.value = '0';
                        option_Placeholder_Frist.setAttribute('selected', '');
                        option_Placeholder_Frist.setAttribute('disabled', '');
                        option_Placeholder_Frist.setAttribute('hidden', '');
                        select_.appendChild(option_Placeholder_Frist);
                        data.d.forEach(function (data) {

                            var option = document.createElement("option");
                            option.value = data;
                            option.text = data;
                            select_.appendChild(option);
                        })
                        select_.onchange = function () {
                            $(this).attr('disabled', 'disabled');

                            var selected = $(this).val();
                            $.ajax({
                                url: 'WebForm1.aspx/Type_File',
                                type: 'POST',
                                data: '{ data: "' + selected + '"}',
                                contentType: 'application/json; charset=utf-8',
                                dataType: 'json',
                                success: function (data) {
                                    console.log(data);

                                    var bt_add_row = document.getElementById('bt_Add_row_table');
                                    bt_add_row.disabled = '';
                                    var bt_save_row = document.getElementById('bt_Save_row_table');
                                    bt_save_row.disabled = '';

                                    var table_ = document.getElementById("example_table");
                                    table_.rows[1].cells[2].innerHTML = null;
                                    table_.rows[1].cells[3].innerHTML = null;


                                    table_.rows[1].cells[2].appendChild(Gen_Filer(selected, data.d, 1, 1, 'ul'));
                                    table_.rows[1].cells[3].appendChild(Gen_Bt_Delete_Row());
                                    validator.reload();



                                }
                            });
                        };

                        var table_ = document.getElementById("example_table");
                        table_.rows[1].cells[1].appendChild(select_);





                        successmessage = 'Data was succesfully captured';
                    }
                });

                return true;

            }
            function Add_row() {
                var tableID = 'example_table';
                $.ajax({
                    url: 'WebForm1.aspx/Datainput_',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8"',
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        var table_ = document.getElementById(tableID).getElementsByTagName('tbody')[0];
                        var newRow = table_.insertRow();
                        var newCell_1 = newRow.insertCell();
                        newCell_1.innerHTML = table_.rows.length ;
                        var newCell_2 = newRow.insertCell();
                        var newCell_3 = newRow.insertCell();
                        var newCell_4 = newRow.insertCell();



                        var select_ = document.createElement('select');
                        select_.id = 'Type_Select'
                        select_.className = 'form-select'
                        select_.style = 'border-radius: 10px; box-shadow: 0 6px 10px 0 rgb(214 214 214)!important;';


                        var option_Placeholder_Frist = document.createElement('option')
                        option_Placeholder_Frist.text = 'Select Saction type';
                        option_Placeholder_Frist.setAttribute('selected', '');
                        option_Placeholder_Frist.setAttribute('disabled', '');
                        option_Placeholder_Frist.setAttribute('hidden', '');

                        select_.appendChild(option_Placeholder_Frist);
                        var ArrySelect = [];
                        for (var i = 0; i < table_.rows.length-1; i++) {
                            var data_Select = $(table_.rows[i].cells[1]).children('select')[0].value;
                            ArrySelect.push(data_Select);
                        }
                        data.d.forEach(function (data) {
                     
                            if (!($.inArray(data, ArrySelect) !== -1)) {

                                var option = document.createElement("option");
                                option.value = data;
                                option.text = data;
                                select_.appendChild(option);
                            }
                        })
                        select_.onchange = function () {
                            $(this).attr('disabled', 'disabled');

                            var selected = $(this).val();
                            $.ajax({
                                url: 'WebForm1.aspx/Type_File',
                                type: 'POST',
                                data: '{ data: "' + selected + '"}',
                                contentType: 'application/json; charset=utf-8',
                                dataType: 'json',
                                success: function (data) {
                                    console.log(data);






                                    newCell_3.appendChild(Gen_Filer(selected, data.d, 1, 1, 'ul'));
                                    newCell_4.appendChild(Gen_Bt_Delete_Row());
                                    validator.reload();

                                }
                            });
                        };
                        newCell_2.appendChild(select_);




                        successmessage = 'Data was succesfully captured';
                    }
                });
            }
            function Gen_Filer(TypeFilter, arrayFile, Group_index, index, type_output) {
                let index_List = index;


                var arrayConditions = ['Start with...', 'Contains...', 'Equals']


                var UL_Elemenet = document.createElement('ul')
                UL_Elemenet.className = 'Patten_Filter_UI_LI'
                UL_Elemenet.id = 'Filter_UI_LI_' + TypeFilter + '_' + Group_index;
                var LI_Element = document.createElement('li')
                LI_Element.id = 'Filter_LI_' + TypeFilter + '_' + Group_index + '_' + index;


                var div_Fileter = document.createElement('div')
                div_Fileter.className = 'container p-3 Patten_Filter'
                div_Fileter.id = "Patten_Filter"

                var div_Fileter_Row = document.createElement('div')
                div_Fileter_Row.className = 'row'
                var div_Fileter_Col = document.createElement('div')
                div_Fileter_Col.className = 'col'


                var lablel_input = document.createElement('label')
                lablel_input.setAttribute('for', 'inputGroup_File')
                lablel_input.className = 'form-label'
                lablel_input.innerHTML = 'File'
                div_Fileter_Col.appendChild(lablel_input);
                var div_input_group = document.createElement('div');
                div_input_group.className = 'input-group'
                var select_input_group = document.createElement('select');
                select_input_group.id = 'inputGroup_File'
                select_input_group.className = 'form-select'
                select_input_group.setAttribute('required', '');
                var option_Placeholder = document.createElement('option')
                option_Placeholder.value = '';
                option_Placeholder.text = 'Select File';
                option_Placeholder.setAttribute('selected', '');
                option_Placeholder.setAttribute('disabled', '');
                option_Placeholder.setAttribute('hidden', '');
                select_input_group.appendChild(option_Placeholder);
                //forEach list string
                arrayFile.forEach(function (data) {
                    var option = document.createElement('option')
                    option.value = data
                    option.text = data
                    select_input_group.appendChild(option);
                });
                select_input_group.onchange = (function () {

                    console.log(this.value);
                    
                });


                div_input_group.appendChild(select_input_group);
                div_Fileter_Col.appendChild(div_input_group);














                var div_Fileter_Col_1 = document.createElement('div')
                div_Fileter_Col_1.className = 'col'
                var lablel_input_1 = document.createElement('label')
                lablel_input_1.setAttribute('for', 'inputGroup_File')
                lablel_input_1.className = 'form-label'
                lablel_input_1.innerHTML = 'Conditions'
                div_Fileter_Col_1.appendChild(lablel_input_1);


                //#region Select Type
                var div_input_group_1 = document.createElement('div');
                div_input_group_1.className = 'input-group'
                var select_input_group_1 = document.createElement('select');
                select_input_group_1.id = 'inputGroup_Conditions'
                select_input_group_1.className = 'form-select'
                select_input_group_1.setAttribute('required', '');
                var option_Placeholder_1 = document.createElement('option')
                option_Placeholder_1.value = '';
                option_Placeholder_1.text = 'Select Conditions';
                option_Placeholder_1.setAttribute('selected', '');
                option_Placeholder_1.setAttribute('disabled', '');
                option_Placeholder_1.setAttribute('hidden', '');
                select_input_group_1.appendChild(option_Placeholder_1);
                //forEach list string

                arrayConditions.forEach(function (data) {
                    var option = document.createElement('option')
                    option.value = data
                    option.text = data
                    select_input_group_1.appendChild(option);
                });
                div_input_group_1.appendChild(select_input_group_1);
                div_Fileter_Col_1.appendChild(div_input_group_1);

                //#endregion    


                var div_Fileter_Col_2 = document.createElement('div')
                div_Fileter_Col_2.className = 'col'
                var lablel_input_2 = document.createElement('label')
                lablel_input_2.className = 'form-label'
                lablel_input_2.innerHTML = 'Criteria'
                div_Fileter_Col_2.appendChild(lablel_input_2);
                var div_input_group_2 = document.createElement('div');
                div_input_group_2.className = 'input-group'
                var input_group_2 = document.createElement('input');
                input_group_2.className = 'form-control'
                div_input_group_2.appendChild(input_group_2);
                div_Fileter_Col_2.appendChild(div_input_group_2);




                var div_Fileter_Col_3 = document.createElement('div')
                div_Fileter_Col_3.className = 'col'
                var div_3 = document.createElement('div')
                div_3.style = 'display: inline-flex; align-items: center; padding: 10px;';

                //#region button_ADD
                var div_button_ADD_3 = document.createElement('div')
                div_button_ADD_3.id = 'div_button_ADD_' + TypeFilter + '_' + Group_index + '_' + index_List;
                var button_ADD_3 = document.createElement('button');
                button_ADD_3.id = 'button_ADD_Filter_' + TypeFilter + '_' + Group_index + '_' + index_List;
                button_ADD_3.type = 'button';
                button_ADD_3.className = 'btn border border-primary bt_Add';
                var tag_i_3 = document.createElement('i')
                tag_i_3.className = 'bi bi-plus icon_Add'
                tag_i_3.innerHTML = 'ADD'
                button_ADD_3.appendChild(tag_i_3);
                button_ADD_3.onclick = function () {

                    $.ajax({
                        url: 'WebForm1.aspx/Type_File',
                        type: 'POST',
                        data: '{ data: "' + $(this).val() + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            console.log(data);

                            var UL = document.getElementById('Filter_UI_LI_' + TypeFilter + '_' + Group_index);

                            let next = index_List + 1;
                            UL.appendChild(Gen_Filer(TypeFilter, data.d, Group_index, next, 'li'));
                            validator.reload();

                        }
                    });




                    var div = document.getElementById('div_button_ADD_' + TypeFilter + '_' + Group_index + '_' + index_List)
                    /*div.innerHTML = '';*/
                    var divssss = document.getElementById('button_ADD_Filter_' + TypeFilter + '_' + Group_index + '_' + index_List)
                    divssss.style = 'display:none;'
                    var Switch_Check = document.createElement('input')
                    Switch_Check.id = 'Switch_Check_' + TypeFilter + '_' + Group_index + '_' + index_List;
                    Switch_Check.type = 'checkbox';
                    Switch_Check.setAttribute('checked', '');
                    //Switch_Check.setAttribute('data-toggle', 'toggle');
                    div.appendChild(Switch_Check);

                    $('#Switch_Check_' + TypeFilter + '_' + Group_index + '_' + index_List).bootstrapToggle({
                        on: 'AND',
                        off: 'OR',
                        onstyle: 'primary',
                        offstyle: 'secondary'
                    });
                    Change_Position_bt_trash(TypeFilter, Group_index, 'ADD');



                };
                div_button_ADD_3.appendChild(button_ADD_3)
                div_3.appendChild(div_button_ADD_3);
                //#endregion


                //#region button_X
                var button_X_3 = document.createElement('button');
                button_X_3.type = 'button';
                button_X_3.className = 'bt_Xcircle';
                button_X_3.id = index_List;
                var tag_i_X_3 = document.createElement('i')
                tag_i_X_3.className = 'bi bi-x-circle'
                tag_i_X_3.style = 'font-size: 40px; align-items: center; vertical-align: middle;'
                button_X_3.appendChild(tag_i_X_3);
                button_X_3.onclick = function () {


                    var Ul = document.getElementById('Filter_UI_LI_' + TypeFilter + '_' + Group_index);
                    var Li_Last = $(Ul).children('li').last()[0];
                    var Li = document.getElementById('Filter_LI_' + TypeFilter + '_' + Group_index + '_' + index_List);
                    if (Li_Last === Li) {
                        try {
                            var id_Property = $(Ul).children('li').eq(-2)[0].id.split('_');
                            var bt_add = document.getElementById('button_ADD_Filter_' + id_Property[2] + '_' + id_Property[3] + '_' + id_Property[4]);



                            bt_add.style = '';
                            $('#' + 'div_button_ADD_' + id_Property[2] + '_' + id_Property[3] + '_' + id_Property[4]).children('div').remove();
                        } catch (err) { }
                    }
                    if ($(Ul).children('li').length !== 1) {
                        Li.remove();
                    }
                    Change_Position_bt_trash(TypeFilter, Group_index);




                };
                div_3.appendChild(button_X_3);
                //#endregion
                div_Fileter_Col_3.appendChild(div_3);


                div_Fileter_Row.appendChild(div_Fileter_Col);
                div_Fileter_Row.appendChild(div_Fileter_Col_1);
                div_Fileter_Row.appendChild(div_Fileter_Col_2);
                div_Fileter_Row.appendChild(div_Fileter_Col_3);
                div_Fileter.appendChild(div_Fileter_Row);


                LI_Element.appendChild(div_Fileter);
                //UL_Elemenet.appendChild(LI_Element);


                if (type_output === 'ul') {


                    var div_trash = document.createElement('div')
                    div_trash.id = 'div_Patten_Filter_button_trash_' + TypeFilter + '_' + Group_index;
                    div_trash.className = 'Div_Patten_Filter_Type_trash'

                    div_trash.style.top = '36%';
                    var bt_trash = document.createElement('button');
                    bt_trash.id = 'button_trash_Patten_Filter_' + TypeFilter + '_' + Group_index;
                    bt_trash.type = 'button';
                    bt_trash.className = 'btn border border-primary btn_Filter_Trash Patten_Filter_Type_trash';
                    var tag_bt_trash_i_3 = document.createElement('i')
                    tag_bt_trash_i_3.className = 'bi bi-trash3 icon_Filter_Trash'
                    bt_trash.appendChild(tag_bt_trash_i_3);

                    bt_trash.onclick = function () {

                        var UL_this = $(this).closest('ul');
                        var UL_List = $(this).closest('td').children();

                        if (UL_List[UL_List.length - 1] == UL_this[0]) {
                            var Bt = $(UL_List[UL_List.length - 2]).children('div .Div_Patten_Filter_Type_ADD');
                            var Bt_switch = $(Bt).children('div');
                            Bt_switch.remove();
                            var bt_add = $(Bt).children('button:first');
                            bt_add[0].style = '';
                        }

                        var UL_Group = document.getElementById('Filter_UI_LI_' + TypeFilter + '_' + Group_index);
                        UL_Group.remove();


                    };
                    div_trash.appendChild(bt_trash);


                    var div_add = document.createElement('div')
                    div_add.id = 'div_Patten_Filter_button_ADD_' + TypeFilter + '_' + Group_index;
                    div_add.className = 'Div_Patten_Filter_Type_ADD'
                    var bt_add = document.createElement('button');
                    bt_add.id = 'button_ADD_Patten_Filter_' + TypeFilter + '_' + Group_index;
                    bt_add.type = 'button';
                    bt_add.className = 'btn border border-primary Patten_Filter_Type_ADD';
                    var tag_bt_add_i_3 = document.createElement('i')
                    tag_bt_add_i_3.className = 'bi bi-plus icon_Add'
                    tag_bt_add_i_3.innerHTML = 'ADD'
                    bt_add.appendChild(tag_bt_add_i_3);

                    bt_add.onclick = function () {

                        var row_index = $(this).closest('tr').index();
                        console.log(row_index);


                        var table_ = document.getElementById("example_table");
                        var selected = TypeFilter;

                        $.ajax({
                            url: 'WebForm1.aspx/Type_File',
                            type: 'POST',
                            data: '{ data: "' + selected + '"}',
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            success: function (data) {
                                console.log(data);




                                table_.rows[row_index + 1].cells[2].appendChild(Gen_Filer(selected, data.d, Group_index + 1, 1, 'ul'));
                                validator.reload();


                            }
                        });


                        //#region Change Button
                        var bt_add = document.getElementById('button_ADD_Patten_Filter_' + TypeFilter + '_' + Group_index)
                        bt_add.style = 'display:none;'
                        var Switch_Check = document.createElement('input')
                        Switch_Check.id = 'Patten_Filter_Switch_Check_' + TypeFilter + '_' + Group_index;
                        Switch_Check.type = 'checkbox';
                        Switch_Check.setAttribute('checked', '');
                        //Switch_Check.setAttribute('data-toggle', 'toggle');
                        var div = document.getElementById('div_Patten_Filter_button_ADD_' + TypeFilter + '_' + Group_index);
                        div.appendChild(Switch_Check);

                        $('#Patten_Filter_Switch_Check_' + TypeFilter + '_' + Group_index).bootstrapToggle({
                            on: 'AND',
                            off: 'OR',
                            onstyle: 'primary',
                            offstyle: 'secondary'
                        });
                        //#endregion    

                        Change_Position_bt_trash(TypeFilter, Group_index);

                    };
                    div_add.appendChild(bt_add);



                    UL_Elemenet.appendChild(LI_Element)
                    UL_Elemenet.appendChild(div_add)
                    UL_Elemenet.appendChild(div_trash)

                    return UL_Elemenet;

                }
                else if (type_output === 'li') {

                    return LI_Element;
                }



            }
            function Gen_Bt_Delete_Row() {
                var Bt_Delete = document.createElement('button');
                Bt_Delete.type = 'button'
                Bt_Delete.className = 'btn_Type_Trash'
                var I_Bt_Delete = document.createElement('i');
                I_Bt_Delete.className = 'bi bi-trash3 icon_Type_Trash';
                var Label_Bt_Delete = document.createElement('label');
                Label_Bt_Delete.className = 'label_Type_Trash'
                Label_Bt_Delete.innerHTML = ' Delete'


                I_Bt_Delete.appendChild(Label_Bt_Delete);
                Bt_Delete.appendChild(I_Bt_Delete);
                I_Bt_Delete.onclick = function () {
                    debugger;
                    if ($(this).closest('tr')[0].rowIndex === 1) {
                        var bt_save_row = document.getElementById('bt_Save_row_table');
                        bt_save_row.disabled = 'disabled';
                    }
                    var row = $(this).closest('tr').remove();

                    //#region  Gen_index
                    var table = document.getElementById('example_table');
                    for (var i = 1; i < table.rows.length; i++) {
                        table.rows[i].cells[0].innerHTML = i;
                    }
                    //#endregion

                };
                return Bt_Delete;

            }
            function Change_Position_bt_trash(TypeFilter, Group_index, Action_) {

                var divv = document.getElementById('Filter_UI_LI_' + TypeFilter + '_' + Group_index);

                var totalLenght = $(divv).children('li').length;
                var div_trash = document.getElementById('div_Patten_Filter_button_trash_' + TypeFilter + '_' + Group_index);

                if (Action_ === 'ADD') {
                    totalLenght += 1;
                }
                if (totalLenght === 1) {
                    div_trash.style.top = '36%';
                }
                else {
                    div_trash.style.top = '44%';
                }
            }
            function Alert_Sweet(type, title) {
                Swal.fire({
                    icon: type,
                    title: 'Please',
                    text: 'Something went wrong!'
                    //footer: '<a href="">Why do I have this issue?</a>'
                })
            }
            function Save_Data() {
                if (validator.checkAll() === 0) {
                    console.log('start');

                    var table = document.getElementById('example_table');
                    var Data_JSON = [];


                    for (var i = 1; i < table.rows.length; i++) {

                        var Data_Row = {};
                        if (table.rows[i].cells[1].firstChild.value !== "0") {
                            Data_Row["Type"] = table.rows[i].cells[1].firstChild.value;
                            Data_Row["Group_Filter"] = [];
                            var Group_UL;
                            for (var j = 0; j < table.rows[i].cells[2].children.length; j++) {

                                var UL = table.rows[i].cells[2].children[j];
                                Group_UL = {
                                    List: [],
                                    AND_OR: ''
                                };
                                $(UL).children('li').each(function () {
                                    var Data_Li = {};
                                    var Select = $(this).children().find('select');
                                    Data_Li["Select_File"] = Select[0].value;
                                    Data_Li["Select_Conditions"] = Select[1].value;
                                    var Input_ = $(this).children().find('input')[0];
                                    Data_Li["Input_Criteria"] = Input_.value;
                                    try {
                                        var Switch_ = $(this).children().find('input:checkbox')[0];
                                        Data_Li["AND_OR"] = Switch_.checked ? Switch_.labels[0].innerHTML : Switch_.labels[1].innerHTML

                                    } catch (err) {
                                        Data_Li["AND_OR"] = '';
                                    }
                                    Group_UL["List"].push(Data_Li);

                                });
                                try {
                                    var Switch_Group = $(UL).children('div').find('input:checkbox')[0];
                                    Group_UL["AND_OR"] = Switch_Group.checked ? Switch_Group.labels[0].innerHTML : Switch_Group.labels[1].innerHTML;
                                } catch (err) {
                                    Group_UL["AND_OR"] = '';
                                }

                                Data_Row["Group_Filter"].push(Group_UL);

                            }

                        }
                        Data_JSON.push(Data_Row);

                    }
                    console.log("%j", Data_JSON);


                }
                return false;
            }


        </script>


        <div id="Div_All_validate" class="container-xxl needs-validation" novalidate>
            <div class="row m-5">
                <div class="col">

                    <table id="example_table" class="table table-striped table-bordered text-center" style="width: 100%;">
                        <colgroup>
                            <col width="2">
                            <col width="200">
                            <col width="900">
                            <col width="100">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>@#</th>
                                <th>Type</th>
                                <th>Filter</th>
                                <th>Button</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div id="div_button_ADD_TEST">
                        <button type="button" id="bt_Add_row_table" disabled="disabled" class="btn border border-primary bt_Add" onclick="Add_row();">
                            <i class="bi bi-plus icon_Add">ADD</i></button>
                    </div>
                </div>
                <div class="col text-end">
                    <div>
                        <input type="submit" onclick="return Save_Data();" value="Save" id="bt_Save_row_table" disabled="disabled" class="btn border border-primary bt_Add">
                    </div>
                </div>
            </div>


        </div>
        </form>
</body>
</html>
