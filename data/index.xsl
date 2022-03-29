<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output
  method="xml"
  indent="yes"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes" />
  <xsl:template match="/">

    <html lang="en">

      <head>

        <link rel="icon" type="image/png" href="index_files/favicon.ico"/>

        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="description" content="{data/head-description}" />
        <meta name="author" content="jelezarov.vladimir@gmail.com"/>

        <title><xsl:value-of select="data/head-title" /></title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="index_files/css/styles.css"/>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="index_files/js/scripts.js"></script>

      </head>

      <body data-spy="scroll" data-target=".navbar" data-offset="100">

        <!-- navbar -->
        <nav class="navbar navbar-inverse navbar-fixed-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-collapse-1">
                <span class="sr-only"><xsl:value-of select="data/toggle-navigation" /></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">vlzware.com</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-collapse-1">
              <ul class="nav navbar-nav">
                <li>
                  <a href="#about" onclick="collapse()"><xsl:value-of select="data/nav_entry_about" /></a>
                </li>
                <li>
                  <a href="#portfolio" onclick="collapse()"><xsl:value-of select="data/nav_entry_portfolio" /></a>
                </li>
                <li>
                  <a href="#docs" onclick="collapse()"><xsl:value-of select="data/nav_entry_docs" /></a>
                </li>
                <li>
                  <a href="#contact" onclick="collapse()"><xsl:value-of select="data/nav_entry_contact" /></a>
                </li>
                <li>
                  <a href="{data/switch_lang_url}" onclick="collapse()" title="{data/switch_lang}">
                    <img class="img-responsive" src="{data/switch_lang_icon}" alt="{data/switch_lang}" />
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <!-- / navbar -->

        <div class="container">

          <!-- header about / -->
          <div id="about" class="row anchor">
            <div class="col-lg-12">
              <h1 class="page-header">- <xsl:value-of select="data/about/header" /> -</h1>
            </div>
          </div>
          <div class="row">
            <div class="col-md-5 div-preview">
              <img class="img-responsive" src="index_files/media/vlz.jpg" alt="vladimir"/>
            </div>
            <div class="col-md-7">
              <h3 class="text-info"><xsl:value-of select="data/about/my_name" /></h3>
              <ul>
                <xsl:for-each select="data/about/bullets/bullet">
                  <li><xsl:value-of select="." disable-output-escaping="yes" /></li>
                </xsl:for-each>
              </ul>
              <xsl:value-of select="data/about/working-on" />
              <ul>
                <xsl:for-each select="data/about/current_projects/project">
                  <li><xsl:value-of select="." disable-output-escaping="yes" /></li>
                </xsl:for-each>
              </ul>

            </div>
          </div>
          <!-- / header about -->

          <!-- PORTFOLIO -->

          <!-- header portfolio / -->
          <div id="portfolio" class="row anchor">
            <div class="col-lg-12">
              <h1 class="page-header">- <xsl:value-of select="/data/portfolio" /> -</h1>
            </div>
          </div>
          <!-- / header portfolio -->

          <xsl:for-each select="data/domain">

          <!-- domain header -->
            <div id="{concat('domain-header-',domain_id)}" class="row portfolio-head " onclick="toggle('{domain_id}')">
              <xsl:attribute name="class">
                <xsl:text>row portfolio-head</xsl:text>
                <xsl:if test="position() = 1"> portfolio-head-first</xsl:if>
              </xsl:attribute>
              <div class="col-lg-12">
                <h4 class="{concat('page-header portfolio-head-',domain_id)}"><i id="{concat('ptoggle-',domain_id)}" class="fa fa-plus-square-o" aria-hidden="true"></i>&#160;<xsl:value-of select="domain_title"/></h4>
              </div>
            </div>

            <!-- domain main body -->
            <div class="portfolio-div" id="{concat('portfolio-',domain_id)}">
              <xsl:for-each select="projects/project">
                <xsl:if test="enabled = '1'">

                  <!-- project header -->
                  <div class="row">
                    <div class="col-lg-12">
                      <h2 class="page-header"><small>- <xsl:value-of select="../../domain_title_small"/> -</small><br />
                        <em><xsl:value-of select="project_title"/></em>
                      </h2>
                    </div>
                  </div>
                  <!-- / project header -->


                  <!-- project body -->
                  <div class="row">

                    <!-- thumbnail -->
                    <div class="col-md-5 div-preview">
                      <a>
                        <xsl:attribute name="href">
                          <xsl:value-of select="thumbnail/th_url" />
                        </xsl:attribute>
                        <xsl:attribute name="title">
                          <xsl:value-of select="thumbnail/th_title" />
                        </xsl:attribute>
                        <img class="img-responsive preview">
                          <xsl:attribute name="src">
                            <xsl:value-of select="thumbnail/th_file" />
                          </xsl:attribute>
                          <xsl:attribute name="alt">
                            <xsl:value-of select="thumbnail/th_alt" />
                          </xsl:attribute>
                        </img>
                      </a>
                    </div>
                    <!-- / thumbnail -->

                    <div class="col-md-7">

                      <!-- headers text -->
                      <h3 class="text-info">
                        <xsl:value-of select="header" />
                      </h3>
                      <p class="top20">
                        <xsl:value-of select="subheader" disable-output-escaping="yes" />
                      </p>
                      <!-- / headers text -->

                      <!-- bullets -->
                      <ul>
                        <xsl:for-each select="list/bullet">
                          <xsl:if test="normalize-space() != ''">
                            <li><xsl:value-of select="." disable-output-escaping="yes" /></li>
                          </xsl:if>
                        </xsl:for-each>
                      </ul>
                      <!-- / bullets -->

                      <p class="small">
                        <xsl:value-of select="comment" />
                      </p>
                      <p class="top-space">
                        <xsl:value-of select="call_to_action" />
                      </p>

                      <!-- buttons -->
                      <xsl:if test="source/src_url != ''">
                        <p>
                          <a class="btn btn-primary">
                            <xsl:attribute name="href">
                              <xsl:value-of select="source/src_url" />
                            </xsl:attribute>
                            <xsl:attribute name="title">
                              <xsl:value-of select="source/src_url_title" />
                            </xsl:attribute>
                            <xsl:value-of select="source/src_name" />
                            <xsl:if test="source/src_icon != ''">
                              &#160;
                              <i aria-hidden="true">
                                <xsl:attribute name="class">
                                  <xsl:text>fa </xsl:text>
                                  <xsl:value-of select="source/src_icon" />
                                </xsl:attribute>
                              </i>
                            </xsl:if>
                          </a>
                        </p>
                      </xsl:if>
                      <xsl:if test="website/web_url != ''">
                        <p>
                          <a class="btn btn-primary">
                            <xsl:attribute name="href">
                              <xsl:value-of select="website/web_url" />
                            </xsl:attribute>
                            <xsl:attribute name="title">
                              <xsl:value-of select="website/web_url_title" />
                            </xsl:attribute>
                            <xsl:value-of select="website/web_name" />
                            <xsl:if test="website/web_icon != ''">
                              &#160;
                              <i aria-hidden="true">
                                <xsl:attribute name="class">
                                  <xsl:text>fa </xsl:text>
                                  <xsl:value-of select="website/web_icon" />
                                </xsl:attribute>
                              </i>
                            </xsl:if>
                          </a>
                        </p>
                      </xsl:if>
                      <!-- / buttons -->

                      <p class="top-space">
                        <xsl:value-of select="/data/technologies" />:&#160;
                        <xsl:for-each select="technologies/tag[. != '']">
                          <xsl:value-of select="." />
                          <xsl:if test="position() != last()">,&#160;</xsl:if>
                        </xsl:for-each>
                      </p>
                      <p class="small"><xsl:value-of select="/data/last_modified" />: <xsl:value-of select="last_modified" /></p>

                    </div>
                  </div>
                  <!-- / project body -->

                  <hr class="top-space" />
                </xsl:if>
              </xsl:for-each>
            </div>
            <!-- / domain main body -->

          </xsl:for-each>
          <!-- / PORTFOLIO -->

          <!-- DOCS -->

          <!-- header docs / -->
          <div id="docs" class="row anchor">
            <div class="col-lg-12">
              <h1 class="page-header">- <xsl:value-of select="/data/docs/docs_title" /> -</h1>
            </div>
          </div>
          <!-- / header docs -->

          <!-- docs / -->
          <div class="row">
            <div class="col-md-5 div-preview">
            </div>
            <div class="col-md-7">
              <xsl:for-each select="/data/docs/themes/theme">
                <xsl:value-of select="name" />:
                <ul>
                  <xsl:for-each select="bullets/bullet" >
                    <li><xsl:value-of select="." disable-output-escaping="yes" /></li>
                  </xsl:for-each>
                </ul>
              </xsl:for-each>
            </div>
          </div>
          <!-- / docs -->

          <!-- / DOCS -->
          <!-- CONTACT -->

          <!-- header contact / -->
          <div id="contact" class="row anchor">
            <div class="col-lg-12">
              <h1 class="page-header">- <xsl:value-of select="/data/contact/contact_title" /> -</h1>
            </div>
          </div>
          <!-- / header contact -->

          <!-- Contact / -->
          <div class="row">
            <div class="col-lg-12 text-center">
              <a href="mailto:jelezarov.vladimir@gmail.com" title="{/data/contact/mail_url_title}"><i class="fa fa-envelope-o cicons" aria-hidden="true"></i></a><a href="https://keys.openpgp.org/search?q=jelezarov.vladimir@gmail.com" title="{/data/contact/pubkey_url_title}"><xsl:value-of select="/data/contact/pubkey" /></a>
            </div>
          </div>
          <!-- / Contact -->

          <div class="bottom-space"></div>

        </div>
        <!-- / container -->

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
