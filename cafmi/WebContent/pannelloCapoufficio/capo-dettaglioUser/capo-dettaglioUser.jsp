<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import = "model.User" %>
	<%@ page import = "data.UserDAO" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    		<%String nome = (String)session.getAttribute("nome");
        String cognome = (String)session.getAttribute("cognome");
        int id = (int)session.getAttribute("id"); %>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>CAFMi | Dettaglio User</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
         <!-- CSS -->
        <link href="pannelloCapoufficio/css/admin-stile.css" rel="stylesheet" />  
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="pannelloCapoufficio/capo-index/img/logo.png" />      
    </head>
    <body class="sb-nav-fixed">

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="dirigente">
                <img src="pannelloCapoufficio/capo-dettaglioUser/img/logo-banner.png" alt="CAFMi logo-banner" width="100px" height="30px">
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                <p id="nomePannello" class="text-light">Accesso: <%out.print(cognome);%> <%out.print(nome); %></p>
                </div>
            </div>


<!-- NAVBAR SIDE-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    		<li><a class="dropdown-item" href="home">Home</a></li>
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                        	<div class="sb-sidenav-menu-heading">PRINCIPALI</div>
                            <a class="nav-link" href="home">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-house-chimney"></i></div>
                                Home
                            </a>
                            <a class="nav-link" href="dirigente">
                                <div class="sb-nav-link-icon"><i class="fa-sharp fa-solid fa-house-user"></i></div>
                                Pannello Dirigente 
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">GESTIONE DELLA CLIENTELA</div>
                            <a class="nav-link" href="e_cli">
                                <div class="sb-nav-link-icon"><i class="fa-sharp fa-solid fa-user-group"></i></div>
                                Elenco clienti
                            </a>

                            <div class="sb-sidenav-menu-heading">GESTIONE DEL PERSONALE</div>
                            <a class="nav-link" href="e_dip">
                                <div class="sb-nav-link-icon"><i class="fa-sharp fa-solid fa-users"></i></div>
                                Elenco dipendenti
                            </a>
                             <a class="nav-link" href="messaggi_dipendenti">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-file"></i></div>
                                Richieste dipendenti
                            </a>

                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <%int ruolo = (int)session.getAttribute("ruolo"); 
                        if(ruolo == 1){out.print("Dipendente: ");}
                        else if(ruolo == 2) {out.print("Dirigente: ");}
                        %><br><%out.print(cognome);%> <%out.print(nome);%>
                        <div class="small">Login ID: <% out.print(id); %></div>
                    </div>
                </nav>
            </div>
            
            <!-- CONTENUTO DELLA PAGINA-->
            <div id="layoutSidenav_content">
                <main>
                		<% UserDAO acc = new UserDAO(); 
                		int id1 = (int)request.getAttribute("cod_cliente");%>
                    <div class="container px-4">
                        <h1 class="mt-4">Dettaglio del user selezionato</h1>
                        
                        <table class="table table-striped">
                            <tbody>
                              <tr>
                                <th scope="row">Nome</th>
                                <td><% out.print(acc.selectUser(id1).getNome()); %></td>
                              </tr>
                              <tr>
                                <th scope="row">Cognome</th>
                                <td><% out.print(acc.selectUser(id1).getCognome()); %></td>
                              </tr>
                              <tr>
                                <th scope="row">Codice fiscale</th>
                                <td><% out.print(acc.selectUser(id1).getCodice_fiscale()); %></td>
                              </tr>
                              <tr>
                                <th scope="row">Numero di telefono</th>
                                <td><% out.print(acc.selectUser(id1).getNumero_telefono()); %></td>
                              </tr>
                              <tr>
                                <th scope="row">Indirizzo</th>
                                <td><% out.print(acc.selectUser(id1).getIndirizzo()); %></td>
                              </tr>
                              <tr>
                                <th scope="row">Citt�</th>
                                <td><% out.print(acc.selectUser(id1).getCitta()); %></td>
                              </tr>
                              <tr>
                                <th scope="row">CAP</th>
                                <td><% out.print(acc.selectUser(id1).getCap_citta()); %></td>
                              </tr>
                              <tr>
                                <th scope="row">Sesso</th>
                                <td><% out.print(acc.selectUser(id1).getSesso()); %></td>
                              </tr>         
                            </tbody>
                          </table>                      

                    </div>

                 </main>
            </div>
                


            </div>
        </div>

        <!-- BOOTSTRAP -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- JS X NAVBAR -->
        <script src="pannelloCapoufficio/capo-dettaglioUser/capo-dettaglioUser-js.js"></script>
    </body>
</html>
