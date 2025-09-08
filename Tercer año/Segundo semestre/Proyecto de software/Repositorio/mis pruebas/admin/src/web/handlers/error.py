from dataclasses import dataclass

from flask import render_template

@dataclass
class HTTPError:
    code: int
    message: str
    description: str


def not_found(e):
    error=HTTPError(
        code=404,
        message="Pagina no encontrada",
        description="Lo sentimos, la paginoa que buscas no existe."
    )
    
    return render_template("error.html"), 404
