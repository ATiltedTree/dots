use clap::{AppSettings, Clap};
use swayipc::{Connection, Output};

fn get_current_output_index(outputs: &Vec<Output>) -> usize {
    outputs
        .iter()
        .position(|x| x.focused)
        .expect("No focused output")
}

/// AwesomeWM like workspace behavior for sway
#[derive(Debug, Clap)]
#[clap(version, author, about, global_setting = AppSettings::ColoredHelp, setting = AppSettings::GlobalVersion, setting = AppSettings::VersionlessSubcommands)]
enum Args {
    /// Initialize a workspace on all outputs
    Init { name: String },

    /// Move the current window to a workspace
    Move { name: String },

    /// Focus a workspace
    Focus { name: String },
}

fn main() -> std::result::Result<(), Box<dyn std::error::Error>> {
    let args = Args::parse();

    let mut connection = Connection::new()?;

    match args {
        Args::Init { name } => {
            let outputs = connection.get_outputs()?;

            for output in outputs.iter().rev() {
                let cmd = format!("focus output {}", output.name);
                connection.run_command(cmd).expect("Command failed");

                let cmd = format!("workspace {}{}", get_current_output_index(&outputs), name);
                connection.run_command(cmd).expect("Command failed");
            }
        }
        Args::Move { name } => {
            let output = get_current_output_index(&connection.get_outputs()?);
            let cmd = format!("move container to workspace {}{}", output, name);
            connection.run_command(cmd).expect("Command failed");
        }
        Args::Focus { name } => {
            let output = get_current_output_index(&connection.get_outputs()?);
            let cmd = format!("workspace {}{}", output, name);
            connection.run_command(cmd).expect("Command failed");
        }
    }

    Ok(())
}
