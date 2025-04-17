<%@ Page Language="C#" AutoEventWireup="true"
         CodeBehind="ServiceDirectory.aspx.cs"
         Inherits="FitnessApplication.ServiceDirectory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Service Directory Table</title>
     <a href="Default.aspx" 
           class="btn btn-default" 
           style="
                background:#111;
                color:ghostwhite;
                border:1px solid ghostwhite;
                padding:0.5rem 1rem;
                font-size:1rem;
                border-radius:8px;
                margin-top:0.5rem;
                width:100%;
                text-align:center;
                display:inline-block;
                transition:all 0.3s ease;">
            Home
        </a>
</head>

<body style="
        font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color:#0f0f0f;
        color:ghostwhite;
        line-height:1.6;
        margin:0;">

    <form id="form1" runat="server"
          style="max-width:1200px; margin:0 auto; padding:3rem 2rem;">

        <!-- SERVICE DIRECTORY CARD -->
        <div style="
                background:#181818;
                border-radius:10px;
                padding:1.5rem;
                margin:1rem 0 2.5rem 0;
                box-shadow:0 4px 12px rgba(0,0,0,.4);">

            <h1 style="
                    color:ghostwhite;
                    font-weight:600;
                    text-shadow:1px 1px 2px #000;
                    margin:0 0 1rem 0;">
                Service Directory
            </h1>

            <table style="
                    width:100%;
                    border-collapse:collapse;
                    font-size:.95rem;">

                <!-- ‑‑‑‑ TABLE HEADER ‑‑‑‑ -->
                <thead>
                    <tr>
                        <th style="
                                background:#111;
                                color:ghostwhite;
                                padding:.75rem;
                                text-align:left;
                                border-bottom:2px solid #00ffae;
                                position:sticky;top:0;z-index:2;">
                            Service / Component Name
                        </th>
                        <th style="
                                background:#111;
                                color:ghostwhite;
                                padding:.75rem;
                                text-align:left;
                                border-bottom:2px solid #00ffae;
                                position:sticky;top:0;z-index:2;">
                            Description
                        </th>
                        <th style="
                                background:#111;
                                color:ghostwhite;
                                padding:.75rem;
                                text-align:left;
                                border-bottom:2px solid #00ffae;
                                position:sticky;top:0;z-index:2;">
                            Type
                        </th>
                        <th style="
                                background:#111;
                                color:ghostwhite;
                                padding:.75rem;
                                text-align:left;
                                border-bottom:2px solid #00ffae;
                                position:sticky;top:0;z-index:2;">
                            Parameters
                        </th>
                        <th style="
                                background:#111;
                                color:ghostwhite;
                                padding:.75rem;
                                text-align:left;
                                border-bottom:2px solid #00ffae;
                                position:sticky;top:0;z-index:2;">
                            Return Value
                        </th>
                        <th style="
                                background:#111;
                                color:ghostwhite;
                                padding:.75rem;
                                text-align:left;
                                border-bottom:2px solid #00ffae;
                                position:sticky;top:0;z-index:2;">
                            Try It
                        </th>
                    </tr>
                </thead>

                <!-- ‑‑‑‑ TABLE BODY ‑‑‑‑ -->
                <tbody>
                    <!-- Row 1 (darker) -->
                    <tr style="background:#202020;">
                        <td style="padding:.75rem;border-bottom:1px solid #333;">Workout Preference Saver</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">Stores user workout choice in a cookie</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">Cookie</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">None</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">String (preference)</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">
                            <a href="TryWorkoutSaver.aspx"
                               style="
                                   display:inline-block;
                                   background:#111;
                                   color:ghostwhite;
                                   border:1px solid ghostwhite;
                                   padding:.4rem .8rem;
                                   border-radius:6px;
                                   font-size:.9rem;
                                   text-decoration:none;"
                               onmouseover="this.style.background='ghostwhite';this.style.color='#111';"
                               onmouseout ="this.style.background='#111';this.style.color='ghostwhite';">
                               Go
                            </a>
                        </td>
                    </tr>

                    <!-- Row 2 (lighter) -->
                    <tr style="background:#262626;">
                        <td style="padding:.75rem;border-bottom:1px solid #333;">Motivational Quote Generator</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">Displays a motivational quote from a hard‑coded list</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">User Control</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">None</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">String (quote)</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">
                            <a href="TryMotivationQuote.aspx"
                               style="
                                   display:inline-block;
                                   background:#111;
                                   color:ghostwhite;
                                   border:1px solid ghostwhite;
                                   padding:.4rem .8rem;
                                   border-radius:6px;
                                   font-size:.9rem;
                                   text-decoration:none;"
                               onmouseover="this.style.background='ghostwhite';this.style.color='#111';"
                               onmouseout ="this.style.background='#111';this.style.color='ghostwhite';">
                               Go
                            </a>
                        </td>
                    </tr>

                    <!-- Row 3 (darker) -->
                    <tr style="background:#202020;">
                        <td style="padding:.75rem;border-bottom:1px solid #333;">Calorie Burn Calculator</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">Returns estimated calories burned</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">Web Service</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">weight, minutes, MET</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">Double (calories)</td>
                        <td style="padding:.75rem;border-bottom:1px solid #333;">
                            <a href="https://www.calculator.net/calories-burned-calculator.html"
                               style="
                                   display:inline-block;
                                   background:#111;
                                   color:ghostwhite;
                                   border:1px solid ghostwhite;
                                   padding:.4rem .8rem;
                                   border-radius:6px;
                                   font-size:.9rem;
                                   text-decoration:none;"
                               onmouseover="this.style.background='ghostwhite';this.style.color='#111';"
                               onmouseout ="this.style.background='#111';this.style.color='ghostwhite';">
                               Test
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- /SERVICE DIRECTORY CARD -->
    </form>
</body>
</html>
