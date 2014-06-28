﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Tests_Default" MasterPageFile="~/MasterPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControl" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            

            <ajaxControl:TabContainer runat="server">
                <ajaxControl:TabPanel runat="server" HeaderText="Hibernate setup">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-sm-8">
                                <div class="panel panel-default" id="GenerateSchemaPanelDiv">
                                    <div class="panel-heading">For testing DB connection and build schema</div>
                                    <div class="panel-body">
                                        <!--leave this for the moment-->
                                        <asp:UpdateProgress runat="server" ID="PageUpdateProgress" AssociatedUpdatePanelID="GenerateSchemaPanel">
                                            <ProgressTemplate>
                                                <div class="overlay">
                                                    <img src="../Images/ajax-loader.gif" />
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        <asp:UpdatePanel ID="GenerateSchemaPanel" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="GenerateSchemaButton" runat="server" Text="Generate Schema" OnClick="Generate_Schema" />
                                                <asp:Label ID="GenerateSchemaResult" runat="server"></asp:Label>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                </ajaxControl:TabPanel>
                <ajaxControl:TabPanel runat="server" HeaderText="User Module">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-lg-6" style="height: 500px; overflow: auto;">
                                <!--create user entities-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">Test insertion of UserAccounts</div>
                                    <div class="panel-body">
                                        <asp:UpdateProgress runat="server" ID="UpdateProgress1" AssociatedUpdatePanelID="InsertUserAccountPanel">
                                            <ProgressTemplate>
                                                <div class="overlay">
                                                    <img src="../Images/ajax-loader.gif" />
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        <asp:UpdatePanel ID="InsertUserAccountPanel" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12">

                                                        <asp:Label ID="TestInsertUserAccount_NumberOfUsers" runat="server" Text="Num of Users:" />&nbsp;
                                                        <asp:TextBox ID="TestInsertUserAccount_NumberOfUsers_Textbox" runat="server" Width="50" />
                                                        <ajaxControl:FilteredTextBoxExtender ID="numUsersFilter" runat="server"
                                                            TargetControlID="TestInsertUserAccount_NumberOfUsers_Textbox"
                                                            FilterType="Numbers" />
                                                        <asp:Button ID="TestInsertUserAccount_NumberOfUsers_Submit" runat="server" Text="Insert"
                                                            OnClick="Test_Insert_UserAccount" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="panel panel-default">
                                                            <asp:DataGrid ID="InsertedUserTable" runat="server" CssClass="table"
                                                                AllowPaging="true" PageSize="10"
                                                                OnPageIndexChanged="InsertedUserTable_PageIndexChanging"
                                                                DataKeyField="USERID">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="USERID" />
                                                                    <asp:BoundColumn DataField="PASSWORD" />
                                                                </Columns>
                                                                <PagerStyle Position="Bottom" CssClass="pagination" />
                                                            </asp:DataGrid>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <!--encrypt password-->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">Test encryption of passwords</div>
                                            <div class="panel-body">
                                                <asp:UpdateProgress runat="server" ID="UpdateProgress2" AssociatedUpdatePanelID="TestEncryptPasswordPanel">
                                                    <ProgressTemplate>
                                                        <div class="overlay">
                                                            <img src="../Images/ajax-loader.gif" />
                                                        </div>
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                                <asp:UpdatePanel ID="TestEncryptPasswordPanel" runat="server">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="form-group">

                                                                <asp:Label ID="Label1" runat="server" Text="Password:"
                                                                    CssClass="col-sm-3 control-label" />
                                                                <div class="col-sm-5">
                                                                    <asp:TextBox ID="password" TextMode="password" runat="server" CssClass="form-control" />
                                                                </div>
                                                                <div class="col-sm-4">
                                                                    <asp:Button ID="encryptPasswordButton" runat="server" Text="Encrypt"
                                                                        CssClass="btn btn-default"
                                                                        OnClick="EncryptPassword" />
                                                                </div>

                                                            </div>

                                                        </div>
                                                        <div class="row" style="margin-top: 20px;">
                                                            <div class="well well-sm col-sm-10 col-sm-offset-1" style="overflow: auto">
                                                                <asp:Label ID="encryptedPassword" runat="server" CssClass="col-sm-12" />
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <!--test login-->
                                    <div class="col-lg-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">Test login</div>
                                            <div class="panel-body">
                                                <asp:UpdateProgress runat="server" ID="UpdateProgress3" AssociatedUpdatePanelID="TestLoginPanel">
                                                    <ProgressTemplate>
                                                        <div class="overlay">
                                                            <img src="../Images/ajax-loader.gif" />
                                                        </div>
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                                <asp:UpdatePanel ID="TestLoginPanel" runat="server">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <asp:PlaceHolder ID="login_message" runat="server"></asp:PlaceHolder>
                                                        </div>
                                                        <div class="row">
                                                            <div class="form-group">
                                                                <asp:Label Text="ID: " runat="server" CssClass="col-sm-4 col-lg-offset-1 control-label"></asp:Label>
                                                                <div class="col-sm-6">
                                                                    <asp:TextBox ID="input_userid" runat="server" CssClass="form-control"></asp:TextBox>
                                                                    <ajaxControl:FilteredTextBoxExtender ID="FilterUserid" runat="server"
                                                                        TargetControlID="input_userid"
                                                                        FilterType="Numbers" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-top: 5px;">
                                                            <div class="form-group">
                                                                <asp:Label Text="Password: " runat="server" CssClass="col-sm-4 col-lg-offset-1 control-label"></asp:Label>
                                                                <div class="col-sm-6">
                                                                    <asp:TextBox ID="input_password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row" style="margin-top: 5px;">
                                                            <div class="col-lg-6 col-lg-offset-5" style="text-align: right;">
                                                                <asp:Button ID="login_button" Text="Login" runat="server" OnClick="TestLogin" />
                                                                <asp:Button ID="clear_button" Text="Clear" runat="server" OnClick="ClearLogin"/>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                </ajaxControl:TabPanel>
            </ajaxControl:TabContainer>
        </div>
    </div>


</asp:Content>