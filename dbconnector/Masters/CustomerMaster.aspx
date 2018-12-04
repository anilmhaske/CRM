<%@ page title="Customer Master" language="VB" masterpagefile="~/MasterPage/Home.master" autoeventwireup="false" inherits="Masters_CustomerMaster, App_Web_customermaster.aspx.6044e34" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadPanelBar ID="panelBar" runat="server" ExpandMode="SingleExpandedItem" Width="100%">
        <Items>
            <telerik:RadPanelItem runat="server" Text="Customer Creation" Font-Bold="True" Font-Size="Medium">
                <Items>
                    <telerik:RadPanelItem runat="server" Value="Creation">
                        <ItemTemplate>
                            <table width="100%" style="border: solid 5px #FFFFFF;">
                                <%--<tr>
                                    <td colspan="6">
                                    </td>
                                </tr>--%>
                                <tr style="height: 25px">
                                    <td style="font-size: large; color: #990000; font-weight: bold" align="left">
                                        Customer Creation
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <hr style="border-style: double none none none; border-width: thick; border-color: #C0C0C0;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <table width="80%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblName" runat="server" Text="Customer Name"></asp:Label>
                                                    <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" ></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblBuildingName" runat="server" Text="Building Name"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBuilding" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblFloor" runat="server" Text="Floor"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtFloor" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRoad" runat="server" Text="Road"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRoad" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblLandMark" runat="server" Text="Landmark"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtLandmark" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblArea" runat="server" Text="Area"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtArea" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" ></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadComboBox ID="rcbCity" runat="server">
                                                    </telerik:RadComboBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblPincode" runat="server" Text="Pincode"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPincode" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblGroupName" runat="server" Text="Group Name"></asp:Label>
                                                    <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" ></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadComboBox ID="rcbGroupName" runat="server">
                                                    </telerik:RadComboBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblPhone" runat="server" Text="Phone No"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblMobile" runat="server" Text="Mobile No"></asp:Label>
                                                    <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" ></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblReference" runat="server" Text="Reference"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtReference" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red" ></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rbMale" Text="Male" runat="server" Checked="true"  GroupName="gender" />
                                                    <asp:RadioButton ID="rbFemale" Text="Female" runat="server" GroupName="gender" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblVAT" runat="server" Text="VAT TIN"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtVAT" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblClass" runat="server" Text="Customer Class"></asp:Label>
                                                </td>
                                                <td>
                                                    <telerik:RadComboBox ID="rcbClass" runat="server">
                                                    </telerik:RadComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <hr />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:Label ID="Label1" runat="server" Text="* Fields are compulsary" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="vallogin" ShowSummary="true" DisplayMode="BulletList" HeaderText="" />
                                                    <asp:RequiredFieldValidator ID="ReFValName" runat="server" ErrorMessage="Please enter customer name" Display="None" 
                                                        ValidationGroup="vallogin" ControlToValidate="txtName">
                                                    </asp:RequiredFieldValidator> 
                                                    <asp:RequiredFieldValidator ID="ReFValMob" runat="server" ErrorMessage="Please enter mobile no" Display="None" 
                                                        ValidationGroup="vallogin" ControlToValidate="txtMobile">    
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select city" Display="None" 
                                                        ValidationGroup="vallogin" ControlToValidate="rcbCity" InitialValue="Select City">    
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select group name" Display="None" 
                                                        ValidationGroup="vallogin" ControlToValidate="rcbGroupName" InitialValue="Select Group Name">    
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select customer class" Display="None" 
                                                        ValidationGroup="vallogin" ControlToValidate="rcbClass" InitialValue="Select Customer Class">    
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="ReFValMobNo" runat="server" ControlToValidate="txtMobile" Display="None" 
                                                        ValidationGroup="vallogin" ErrorMessage="Invalid Mobile number, must be 10 digit"
                                                        ValidationExpression="\d{10}">
                                                    </asp:RegularExpressionValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPincode" Display="None" 
                                                        ValidationGroup="vallogin" ErrorMessage="Pincode must be numeric"
                                                        ValidationExpression="\d+">
                                                    </asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="4">
                                                    <telerik:RadButton ID="btnSave" Width="100px" OnClick="btnSave_Click" runat="server" Text="Save" ValidationGroup="vallogin">
                                                    </telerik:RadButton>
                                                    <telerik:RadButton ID="btnCancel" Width="100px" OnClick="btnCancel_Click" runat="server" Text="Cancel">
                                                    </telerik:RadButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8">
                                        <hr style="border-style: solid none none none; border-width: medium; border-color: #C0C0C0;" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelItem>
            <telerik:RadPanelItem runat="server" Text="Customer Information" Expanded="true" Font-Bold="True" Font-Size="Medium" >
                <Items>
                    <telerik:RadPanelItem runat="server" Value="information">
                        <ItemTemplate>
                            <table width="90%" border="0">
                                <tr>
                                    <td style="width: 30%">
                                        Search By Customer Name
                                    </td>
                                    <td style="width: 40%">
                                        <asp:TextBox ID="txtSearch" runat="server" Width="90%" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="~/Images/Search.png"
                                            Height="20" Width="18" OnClick="txtSearch_TextChanged" />
                                    </td>
                                </tr>
                                
                            </table>
                          
                                
                            <telerik:RadGrid ID="GV" runat="server" AutoGenerateColumns="false" Skin="Office2007" OnItemDataBound="GV_ItemDataBound"
                                width="100%" OnNeedDataSource="GV_NeedDataSource" OnItemCreated="GV_ItemCreated" OnUpdateCommand="GV_UpdateCommand" AllowPaging="true" PageSize="20" Height="400px">
                                <ClientSettings >
                                    <Scrolling AllowScroll="True"  UseStaticHeaders="True" SaveScrollPosition="true" FrozenColumnsCount="3">
                                    </Scrolling>
                                </ClientSettings>
                                <MasterTableView DataKeyNames="CustID" AutoGenerateColumns="False" TableLayout="Fixed">    
                                    <Columns>
                                        <telerik:GridEditCommandColumn UniqueName="EditColumn" HeaderStyle-Width="40px" ItemStyle-Width="40px">
                                        </telerik:GridEditCommandColumn>
                                        <telerik:GridTemplateColumn HeaderStyle-Width="40px" ItemStyle-Width="40px" HeaderStyle-Font-Bold="true" HeaderText="SrNo.">
                                            <ItemTemplate>
                                                <%# Container.DataSetIndex+1 %>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="Name" UniqueName="CustName" HeaderText="Customer Name"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-Width="220px" ItemStyle-Width="220px"
                                            EditFormColumnIndex="0">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="BuildingName" UniqueName="buildingName" HeaderText="Building Name" HeaderStyle-Font-Bold="true" 
                                            HeaderStyle-Width="180px" ItemStyle-Width="180px" EditFormColumnIndex="1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Floor" UniqueName="Floor" DataField="Floor" HeaderStyle-Font-Bold="true" 
                                            HeaderStyle-Width="150px" ItemStyle-Width="150px" EditFormColumnIndex="0">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Road" UniqueName="Road" DataField="Road" HeaderStyle-Font-Bold="true" 
                                            HeaderStyle-Width="130px" ItemStyle-Width="130px" EditFormColumnIndex="1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="LandMark" UniqueName="LandMark" DataField="LandMark" HeaderStyle-Font-Bold="true" 
                                            HeaderStyle-Width="130px" ItemStyle-Width="130px" EditFormColumnIndex="0">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Area" UniqueName="Area" DataField="Area" HeaderStyle-Font-Bold="true" 
                                            HeaderStyle-Width="130px" ItemStyle-Width="130px" EditFormColumnIndex="1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="City" UniqueName="City" HeaderStyle-Font-Bold="true" 
                                            Visible="true" HeaderStyle-Width="130px" ItemStyle-Width="130px" EditFormColumnIndex="0">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container.DataItem, "City")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="rcbCity" runat="server"></telerik:RadComboBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="Pincode" UniqueName="Pincode" DataField="Pincode" HeaderStyle-Font-Bold="true" 
                                            HeaderStyle-Width="80px" ItemStyle-Width="80px" EditFormColumnIndex="1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="Group Name" UniqueName="GroupName" HeaderStyle-Font-Bold="true" 
                                            EditFormColumnIndex="0" Visible="true" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container.DataItem, "GroupName")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="rcbgroup" runat="server"></telerik:RadComboBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="Phone no" UniqueName="PhoneNo" DataField="PhNo" HeaderStyle-Font-Bold="true" 
                                            HeaderStyle-Width="150px" ItemStyle-Width="150px" EditFormColumnIndex="1">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="MobileNo" UniqueName="MobileNo" DataField="MobileNo" HeaderStyle-Font-Bold="true" 
                                            HeaderStyle-Width="150px" ItemStyle-Width="150px" EditFormColumnIndex="0">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Reference" UniqueName="Reference" DataField="Referance" HeaderStyle-Font-Bold="true" 
                                            Display="true" EditFormColumnIndex="1" HeaderStyle-Width="130px" ItemStyle-Width="130px">
                                        </telerik:GridBoundColumn>
                                        <%--<telerik:GridBoundColumn HeaderText="Gender" UniqueName="Gender" DataField="Gender" HeaderStyle-Font-Bold="true" 
                                            Display="true" EditFormColumnIndex="0" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                                        </telerik:GridBoundColumn>--%>
                                        <telerik:GridTemplateColumn HeaderText="Gender" UniqueName="Gender" HeaderStyle-Font-Bold="true" 
                                            EditFormColumnIndex="0" Visible="true" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGender" runat="server" Text=<%#DataBinder.Eval(Container.DataItem, "Gender")%> ></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:RadioButton ID="rbMale" GroupName="Gender" runat="server" Text="Male" />
                                                <asp:RadioButton ID="rbFemale" GroupName="Gender" runat="server" Text="Female"/>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn HeaderText="VAT TIN" UniqueName="VAT" DataField="Narration" HeaderStyle-Font-Bold="true" 
                                            Display="true" EditFormColumnIndex="1" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn HeaderText="Class Name" UniqueName="ClassName" HeaderStyle-Font-Bold="true" 
                                            EditFormColumnIndex="0" Visible="true" HeaderStyle-Width="80px" ItemStyle-Width="80px">
                                            <ItemTemplate>
                                                <%#DataBinder.Eval(Container.DataItem, "ClassName")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="rcbClass" runat="server"></telerik:RadComboBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                    <EditFormSettings ColumnNumber="2" CaptionFormatString="Edit details for customer with ID {0}"
                                        CaptionDataField="CustID">
                                        <EditColumn UpdateText="Update" ButtonType="PushButton"  UniqueName="EditCommandColumn1" CancelText="Cancel">
                                        </EditColumn>
                                    </EditFormSettings>
                                    <NoRecordsTemplate>
                                        No users to display ....</NoRecordsTemplate>
                                </MasterTableView>
                            </telerik:RadGrid>
                        
                        </ItemTemplate>
                    </telerik:RadPanelItem>
                </Items>
            </telerik:RadPanelItem>
        </Items>
    </telerik:RadPanelBar>
</asp:Content>
