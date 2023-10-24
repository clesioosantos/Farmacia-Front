import { ChangeEvent, useContext, useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import Produto from "../../../model/Produto";
import Categoria from "../../../model/Categoria";
import { buscar, atualizar, cadastrar } from "../../../service/Service";
import { toastAlerta } from "../../../util/toastAlerta";

function FormularioProdutos() {
  let navigate = useNavigate();

  const { id } = useParams<{ id: string }>();

  const [categorias, setCategorias] = useState<Categoria[]>([]);

  const [produto, setProdutos] = useState<Produto>({
    id: 0,
    name: "",
    description: "",
    amount: 0,
    price: 0,
    photo: "",
    category: null,
    user: null,
  });

  async function bucarProdutoporId(id: string) {
    await buscar(`/products/${id}`, setProdutos, {
      headers: {
        Authorization: token,
      },
    });
  }

  async function buscarCategoriaporId(id: string) {
    await buscar(`/categories/${id}`, setCategoria, {
      headers: {
        Authorization: token,
      },
    });
  }

  async function buscarCategorias() {
    await buscar("/categories/all", setCategorias, {
      headers: {
        Authorization: token,
      },
    });
  }

  useEffect(() => {
    if (token === "") {
      toastAlerta("Você precisa estar logado", "info");
      navigate("/");
    }
  }, [token]);

  useEffect(() => {
    buscarCategorias();
    if (id !== undefined) {
      bucarProdutoporId(id);
      console.log(categoria);
    }
  }, [id]);

  useEffect(() => {
    setProdutos({
      ...produto,
      category: categoria,
    });
  }, [categoria]);

  function atualizarEstado(e: ChangeEvent<HTMLInputElement>) {
    setProdutos({
      ...produto,
      [e.target.name]: e.target.value,
      category: categoria,
    });
  }

  function retornar() {
    navigate("/produto");
  }

  async function gerarNovoProduto(e: ChangeEvent<HTMLFormElement>) {
    e.preventDefault();

    console.log({ produto });

    if (id != undefined) {
      try {
        await atualizar(`/products`, produto, setProdutos, {
          headers: {
            Authorization: token,
          },
        });
        toastAlerta("Produto atualizado com sucesso", "sucesso");
        retornar();
      } catch (error: any) {
        if (error.toString().includes("403")) {
          toastAlerta("O token expirou, favor logar novamente", "info");
          handleLogout();
        } else {
          toastAlerta("Erro ao atualizar o Produto", "erro");
        }
      }
    } else {
      try {
        await cadastrar(`/products`, produto, setProdutos, {
          headers: {
            Authorization: token,
          },
        });
        toastAlerta("Produto cadastrado com sucesso", "sucesso");
        retornar();
      } catch (error: any) {
        if (error.toString().includes("403")) {
          toastAlerta("O token expirou, favor logar novamente", "info");
          handleLogout();
        } else {
          toastAlerta("Erro ao cadastrar o Produto", "erro");
        }
      }
    }
  }

  const carregandoCategoria = categoria.name === "";

  return (
    <div className="container flex flex-col mx-auto items-center">
      <h1 className="text-4xl text-center my-8">
        {id !== undefined ? "Editar Produto" : "Cadastrar Produto"}
      </h1>

      <form onSubmit={gerarNovoProduto} className="flex flex-col w-1/2 gap-4">
        <div className="flex flex-col gap-2">
          <label htmlFor="name">Nome do Produto</label>
          <input
            value={produto.name}
            onChange={(e: ChangeEvent<HTMLInputElement>) => atualizarEstado(e)}
            type="text"
            placeholder="Nome"
            name="name"
            required
            className="border-2 border-slate-700 rounded p-2"
          />
        </div>
        <div className="flex flex-col gap-2">
          <label htmlFor="description">Descrição do produto</label>
          <input
            value={produto.description}
            onChange={(e: ChangeEvent<HTMLInputElement>) => atualizarEstado(e)}
            type="text"
            placeholder="Descricao"
            name="description"
            required
            className="border-2 border-slate-700 rounded p-2"
          />
        </div>
        <div className="flex flex-col gap-2">
          <label htmlFor="amount">Quantidade disponível</label>
          <input
            value={produto.amount}
            onChange={(e: ChangeEvent<HTMLInputElement>) => atualizarEstado(e)}
            type="number"
            placeholder="Quantidade"
            name="amount"
            required
            className="border-2 border-slate-700 rounded p-2 dark:text-black"
          />
        </div>
        <div className="flex flex-col gap-2">
          <label htmlFor="price">Preço do produto</label>
          <input
            value={produto.price}
            onChange={(e: ChangeEvent<HTMLInputElement>) => atualizarEstado(e)}
            type="number"
            placeholder="Preço"
            name="price"
            required
            className="border-2 border-slate-700 rounded p-2 dark:text-black"
          />
        </div>
        <div className="flex flex-col gap-2">
          <label htmlFor="photo">Foto do Produto</label>
          <input
            value={produto.photo}
            onChange={(e: ChangeEvent<HTMLInputElement>) => atualizarEstado(e)}
            type="text"
            placeholder="Foto"
            name="photo"
            className="border-2 border-slate-700 rounded p-2"
          />
        </div>
        <div className="flex flex-col gap-2">
          <p>Categoria do produto</p>
          <select
            name="categoria"
            id="categoria"
            className="border p-2 border-slate-800 rounded"
            onChange={(e) => buscarCategoriaporId(e.currentTarget.value)}
          >
            <option value="" selected disabled>
              Selecione uma categoria
            </option>
            {categorias.map((categoria) => (
              <>
                <option value={categoria.id}>{categoria.name}</option>
              </>
            ))}
          </select>
        </div>
        <button
          disabled={carregandoCategoria}
          type="submit"
          className="rounded disabled:bg-slate-200 bg-indigo-400 hover:bg-indigo-800 text-white font-bold w-1/2 mx-auto block py-2"
        >
          {carregandoCategoria ? (
            <span>Carregando</span>
          ) : id !== undefined ? (
            "Editar"
          ) : (
            "Cadastrar"
          )}
        </button>
      </form>
    </div>
  );
}

export default FormularioProdutos;
