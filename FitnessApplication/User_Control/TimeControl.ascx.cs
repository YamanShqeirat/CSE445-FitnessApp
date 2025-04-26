using System;
using System.Web.UI;

namespace FitnessWebApp.UserControls
{
    public partial class TimerControl : UserControl
    {
        // namespace session keys by ClientID so two timers on one page don't clash
        private string Key(string name) => $"{ClientID}_{name}";

        private DateTime? StartedUtc
        {
            get => Session[Key("Start")] as DateTime?;
            set => Session[Key("Start")] = value;
        }

        private int PausedSeconds
        {
            get => Session[Key("Paused")] == null ? 0 : (int)Session[Key("Paused")];
            set => Session[Key("Paused")] = value;
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            StartedUtc = DateTime.UtcNow;
            tmr.Enabled = true;
            btnStart.Enabled = false;
            btnStop.Enabled = true;
            btnReset.Enabled = false;
        }

        protected void btnStop_Click(object sender, EventArgs e)
        {
            if (StartedUtc != null)
                PausedSeconds += (int)(DateTime.UtcNow - StartedUtc.Value).TotalSeconds;
            StartedUtc = null;
            tmr.Enabled = false;
            btnStart.Enabled = true;
            btnStop.Enabled = false;
            btnReset.Enabled = true;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            StartedUtc = null;
            PausedSeconds = 0;
            lblElapsed.Text = "00:00:00";
            btnStart.Enabled = true;
            btnStop.Enabled = false;
            btnReset.Enabled = false;
        }

        protected void tmr_Tick(object sender, EventArgs e)
        {
            // update only inside UpdatePanel ticks
            lblElapsed.Text = FormatElapsed();
        }

        public override void DataBind()
        {
            base.DataBind();
            // ensure correct text on every full post‑back
            lblElapsed.Text = FormatElapsed();
        }

        private string FormatElapsed()
        {
            int total = PausedSeconds;
            if (StartedUtc != null)
                total += (int)(DateTime.UtcNow - StartedUtc.Value).TotalSeconds;

            var ts = TimeSpan.FromSeconds(total);
            return $"{ts:hh\\:mm\\:ss}";
        }
    }
}