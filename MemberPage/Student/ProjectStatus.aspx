﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectStatus.aspx.cs" Inherits="ProjectStatus" MasterPageFile="~/MasterPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControl" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <asp:DataGrid ID="project_application_list" runat="server" AllowPaging="true" PageSize="10" GridLines="None"
                OnPageIndexChanged="project_application_list_PageIndexChanged" DataKeyField="APPLICATION_ID" BorderStyle="None"
                AllowSorting="true"
                AutoGenerateColumns="False" CssClass="table">
                <HeaderStyle CssClass="" Font-Bold="true"  />
                
                <Columns>
                    
                    <asp:BoundColumn DataField="APPLICATION_ID" HeaderText="Application ID"  />
                    <asp:TemplateColumn HeaderText="Project Title">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem,"PROJECT.PROJECT_TITLE") %>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Owned by company">
                        <ItemTemplate>
                            <%#DataBinder.Eval(Container.DataItem,"PROJECT.PROJECT_OWNER.USERNAME") %>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="APPLICATION_STATUS" HeaderText="Status" />
                </Columns>
            </asp:DataGrid>
        </div>
        
    </div>
    
</asp:Content>

<asp:Content ContentPlaceHolderID="Scripts" runat="server">
    <!--for toggling the project button-->
    <script id="toggle-project-button-script" type="text/javascript">

        $(document).on('click', ".category-button", function () {

            if ($(this).hasClass('btn-danger')) {
                $(this).removeClass('btn-danger');
            } else {

                $(this).addClass('btn-danger');
                $(this).next().attr('name', 'selected')
            }
            return false; //very important! if not the container will refresh!
        });
    </script>
    <!--for truncating longer category names-->
    <script id="truncate-button-script" type="text/javascript">
        $(document).ready(function () {
            $('.truncate').each(function () {
                var button_text = $(this).text().trim();

                if (button_text.length > 33) {
                    $(this).text(button_text.substring(0, 30) + '...');
                }
            })
        })
    </script>
</asp:Content>
