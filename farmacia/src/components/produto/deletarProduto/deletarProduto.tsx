import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import Produto from "../../../model/Produto";
import { buscar, deletar } from "../../../service/Service";
import { toastAlerta } from "../../../util/toastAlerta";

function DeletarProduto() {
  const [produto, setProduto] = useState<Produto>({} as Produto);

  let navigate = useNavigate();

  const { id } = useParams<{ id: string }>();

  async function buscarPorId(id: string) {
    try {
      await buscar(`/products/${id}`, setProduto, {
        headers: {
          Authorization: token,
        },
      });
    } catch (error: any) {
      if (error.toString().includes("403")) {
        toastAlerta("O token expirou, favor logar novamente", "info");
        handleLogout();
      }
    }
  }

  useEffect(() => {
    if (token === "") {
      toastAlerta("Você precisa estar logado", "info");
      navigate("/login");
    }
  }, [token]);

  useEffect(() => {
    if (id !== undefined) {
      buscarPorId(id);
    }
  }, [id]);

  function retornar() {
    navigate("/produtos");
  }

  async function deletarProduto() {
    try {
      await deletar(`/products/${id}`, {
        headers: {
          Authorization: token,
        },
      });

      toastAlerta("Produto apagado com sucesso", "sucesso");
    } catch (error) {
      toastAlerta("Erro ao apagar o Produto", "erro");
    }

    retornar();
  }
  return (
    <div className="container w-1/3 mx-auto">
      <h1 className="text-4xl text-center my-4">Deletar produto</h1>

      <p className="text-center font-semibold mb-4">
        Você tem certeza de que deseja apagar o produto a seguir?
      </p>

      <div className="border flex flex-col rounded-2xl overflow-hidden justify-between">
        <header className="py-2 px-6 bg-indigo-600 text-white font-bold text-2xl">
          Produto
        </header>

        <div className="p-4">
          <img src={produto.photo} className="h-12 rounded-full" alt="" />
          <p className="text-xl h-full">{produto.name}</p>
          <p>{produto.description}</p>
          <p className="mb-3 font-bold text-indigo-900 dark:text-indigo-900">
            R${" "}
            {new Intl.NumberFormat("pt-BR", {
              minimumFractionDigits: 2,
              maximumFractionDigits: 2,
            }).format(produto.price)}
          </p>
        </div>

        <div className="flex">
          <button
            className="text-slate-100 bg-red-400 hover:bg-red-600 w-full py-2"
            onClick={retornar}
          >
            Não
          </button>
          <button
            className="w-full text-slate-100 bg-indigo-400 hover:bg-indigo-600 flex items-center justify-center"
            onClick={deletarProduto}
          >
            Sim
          </button>
        </div>
      </div>
    </div>
  );
}

export default DeletarProduto;
