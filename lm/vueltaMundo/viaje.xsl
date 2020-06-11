<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>
    <xsl:template match="/">

        <html>

            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Viaja con Rubén</title>
                <link rel="icon" href="./img/world.svg" type="image/svg"/>  
                <link rel="alternate" type="application/rss+xml" title="La vuelta al mundo de Rubén" href="./rss/viaje.rss"/>              
                <!-- CSS y Bootstrap -->
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"/>
                <link rel="stylesheet" href="./css/style.css"/>
            
                <!-- JS Bootstrap -->
            
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
                
            </head>

            <body>
                <nav class="navbar sticky-top navbar-expand-md bg-dark navbar-dark">
                    <a href="#" class="navbar-brand">
                        <img src="./img/world.svg" width="30" height="30" title="Viaja con Rubén"/>
                        El viaje de Rubén
                    </a>
                        <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarMenu">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Etapas
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <xsl:for-each select="viajes/viaje/etapa">
                                            <a class="dropdown-item">
                                                <xsl:attribute name="href">
                                                    #<xsl:value-of select="@num"/>
                                                </xsl:attribute> 
                                                Etapa <xsl:value-of select="@num"/>
                                            </a>
                                        </xsl:for-each>
                                    </div>
                                </li>
                            </ul>
                        </div>
                </nav>
                <div class="container text-center titulo">
                    <h1><img src="./img/world.svg" width="37" height="37" title="Viaja con Rubén"/> 
                        EL VIAJE DE RUBÉN 
                        <img src="./img/world.svg" width="37" height="37" title="Viaja con Rubén"/></h1>
                </div>
                <div class="container">
                    <xsl:for-each select="viajes/viaje/etapa">
                        <div class="card tarjeta">
                            <xsl:attribute name="id">
                                <xsl:value-of select="@num"/>
                            </xsl:attribute>
                            <div class="card-body text-center">
                                <h2 class="card-title">
                                    Etapa <xsl:value-of select="@num"/> / <xsl:value-of select="ciudad_salida"/> - <xsl:value-of select="ciudad_llegada"/>
                                </h2>
                                <xsl:element name="img">
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="ciudad_llegada"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="class">
                                        card-img-top img-fluid imagen-tarjeta
                                    </xsl:attribute>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="foto"/>
                                    </xsl:attribute>
                                </xsl:element>
                                <p class="card-text"><strong>Ciudad de Salida: <xsl:value-of select="ciudad_salida"/> 
                                >>> Ciudad de Llegada: <xsl:value-of select="ciudad_llegada"/></strong></p>
                                <p class="card-text"><strong>Transporte: </strong><xsl:value-of select="transporte"/>
                                    <p><strong>Precio: </strong><xsl:value-of select="precio"/>€</p></p>
                                <p class="card-text">"<em><xsl:value-of select="anecdota"/></em>"</p>
                                <p class="card-text text-justify"><xsl:value-of select="descripcion"/></p>
                                <iframe>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="kml"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="class">
                                        img-fluid mapa
                                    </xsl:attribute>
                                </iframe>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
                    <nav class="navbar sticky-bottom justify-content-center navbar-expand-md bg-dark navbar-dark">
                        <a class="navbar-item" href="./rss/viaje.rss" target="_blank">
                            <img src="./img/rss.png" width="30" height="30" alt="RSS" title="RSS"/>
                        </a>
                        <a class="navbar-item" href="https://twitter.com/rubensiio7" target="_blank">
                            <img src="./img/twitter.png" width="50" height="50" alt="Twitter" title="Twitter"/>
                        </a>
                    </nav>
            </body>

        </html>

    </xsl:template>

</xsl:stylesheet>