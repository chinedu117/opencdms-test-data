"""Console script for opencdms."""
import sys
import click
import subprocess
from pathlib import Path
import socket

def _check_port(port)->bool:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        return s.connect_ex(('localhost', port)) == 0


@click.group()
def main(args=None):
    """Console script for opencdms-test-data."""
    # See click documentation at https://click.palletsprojects.com/
    pass

@click.command(name="startdb")
@click.option('--containers', help='Comma separated list of container(s) to be started')
def start_db(containers: str):
    """ 
       Starts Database containers
    
    
     """
    container_port = {
        "postgres": 5432,
        "mariadb": 3306,
        "opencdmsdb": 35432,
        "postgresql": 25432,
        "mysql": 23306,
        "oracle": 21521,
        "clide": 35433,
        "climsoft-4.1.1": 33308,
        "mch-english": 33306,
        "midas": 31521,        
        "wmdr": 35434,
        "surface": 45432

    }
    

    docker_compose_file = f"{Path(__file__).parent}/docker-compose.yml"
    if containers is None:
        # Start all contianers
        service_ports = container_port.values()
        occupied = False
        for port in service_ports:
            if _check_port(port):
                click.echo(f"########### Port {port} is in use by another service. Close the service and run again. #############")
                occupied = True
        if occupied and not click.confirm("Some ports are already in use by another service. Do you want to continue ?"):
            exit(0)
        start_command = f"docker-compose -f {docker_compose_file} up -d"
        containers_started = container_port.keys()
    else:
        containers_to_start = containers.split(",")
        containers_started = []
        for container in containers_to_start:
            if container in container_port.keys():
                if _check_port(container_port[container]) is True:
                    click.echo(f"########### Service Port {container_port[container]} for {container} is in use by another service. #############")
                    continue
            else:
                click.echo(f"########### Invalid container name {container} #############")
                continue            
            containers_started.append(container)
        if len(containers_started) > 0:
            databases = " ".join(containers_started)
            start_command = f"docker-compose -f {docker_compose_file} up -d {databases}"
        else:
            exit(1)
    
    
    click.echo('starting databases....')
    out = subprocess.run(start_command,shell=True)
    if out.returncode != 0:
        click.echo("Start up not successfull")
        click.echo(out.stderr)
        click.echo("please close any conflicting ports")
    else:
        click.echo(out.stdout)
    click.echo("To stop running databases run: opencdms-test-data stopdb")
    return out.returncode

@click.command(name="stopdb")
def stop_db():
    """ Stops all database containers """
    docker_compose_file = f"{Path(__file__).parent}/docker-compose.yml"
    click.echo(docker_compose_file)
    out = subprocess.run(f"docker-compose -f {docker_compose_file} down", shell=True)

main.add_command(start_db)
main.add_command(stop_db)

if __name__ == "__main__":
    sys.exit(main())  # pragma: no cover
