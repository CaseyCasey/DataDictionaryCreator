<?xml version="1.0" encoding="utf-8" standalone="yes"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" />

  <xsl:template match="/">
    <html>
      <head>
        <style>
          table {border-collapse:collapse;}
          th {background-color: #CAE4FF;}
          tr:hover {background-color: #e0e7f9; }
          a{color:Black;}
          a:link {text-decoration: none;}
          a:visited {text-decoration: none;}
          a:active {text-decoration: none;}
          a:hover {text-decoration: underline;}
        </style>
      </head>
      <body id="DataDictionary">
        <h3>Tables</h3>
        <table border="1" width="100%">
          <xsl:call-template name="TablesHead" />
        </table>

        <br />
        <xsl:apply-templates select="documentation/tables/table" />

      </body>
    </html>
  </xsl:template>

  <xsl:template name="TablesHead">
    <xsl:for-each select="documentation/tables/table">
      <xsl:if test="position()=1">
        <tr>
          <th>
            Schema
          </th>
          <th>
            Table
          </th>
          <th>
            Description
          </th>
        </tr>
      </xsl:if>
      <tr>
        <td>
          <xsl:value-of select="@schema"/>
        </td>
        <td>
          <a href="#{@schema}.{@name}">
            <xsl:value-of select="@name"/>
          </a>
        </td>
        <td>
            <xsl:value-of select="@description"/>
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="TablesContent" match="table">
    <strong>
      <a name="{@schema}.{@name}">
        [<xsl:value-of select="@schema"/>].[<xsl:value-of select="@name"/>]
      </a> :
    </strong>
    <xsl:value-of select="@description"/>
    <br />
    <table border="1" width="100%">
      <xsl:apply-templates select="column" />
    </table>
    <br />
  </xsl:template>

  <xsl:template match="column">
    <xsl:if test="position()=1">
      <tr>
        <th>
          Column
        </th>
        <th>
          Datatype
        </th>
        <th>
          Size
        </th>
        <th>
          Nullable
        </th>
        <th>
          InPrimaryKey
        </th>
        <th>
          IsForeignKey
        </th>
        <th>
          Description
        </th>
        <xsl:for-each select="property">
          <th>
            <xsl:value-of select="@name"/>
          </th>
        </xsl:for-each>
      </tr>
    </xsl:if>
    <tr>
      <td>
        <xsl:value-of select="@name" />
      </td>
      <td>
        <xsl:value-of select="@datatype" />
      </td>
      <td>
        <xsl:value-of select="@size" />
      </td>
      <td>
        <xsl:value-of select="@nullable" />
      </td>
      <td>
        <xsl:value-of select="@inprimarykey" />
      </td>
      <td>
        <xsl:value-of select="@isforeignkey" />
      </td>
      <td>
        <xsl:value-of select="@description"/>
      </td>
      <xsl:apply-templates select="property" />
    </tr>
  </xsl:template>

  <xsl:template match="property">
    <td>
      <xsl:value-of select="@value"/>
    </td>
  </xsl:template>

</xsl:stylesheet>
