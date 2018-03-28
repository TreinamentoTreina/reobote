-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Mar-2018 às 03:05
-- Versão do servidor: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reobote`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ajuste_estoque`
--

CREATE TABLE `ajuste_estoque` (
  `ajuste_id` int(10) UNSIGNED NOT NULL,
  `ajuste_fk_produto` int(10) UNSIGNED NOT NULL,
  `ajuste_estoque_antigo` int(11) NOT NULL,
  `ajuste_estoque_novo` int(11) NOT NULL,
  `ajuste_fk_motivo` int(10) UNSIGNED NOT NULL,
  `ajuste_fk_contato` int(10) UNSIGNED NOT NULL,
  `ajuste_observacoes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ajuste_preco_venda`
--

CREATE TABLE `ajuste_preco_venda` (
  `ajuste_pv_id` int(10) UNSIGNED NOT NULL,
  `ajuste_pv_fk_produto` int(10) UNSIGNED NOT NULL,
  `ajuste_pv_preco_atual` double UNSIGNED NOT NULL,
  `ajuste_pv_preco_sugestao` double UNSIGNED NOT NULL,
  `ajuste_pv_preco_novo` double UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_despesas`
--

CREATE TABLE `categoria_despesas` (
  `categoria_despesa_id` int(10) UNSIGNED NOT NULL,
  `categoria_despesa_descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_produtos`
--

CREATE TABLE `categoria_produtos` (
  `pcategoria_id` int(10) UNSIGNED NOT NULL,
  `pcategoria_descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_receitas`
--

CREATE TABLE `categoria_receitas` (
  `categoria_receita_id` int(10) UNSIGNED NOT NULL,
  `categoria_receita_descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `compra_id` int(10) UNSIGNED NOT NULL,
  `compra_fk_contato_fornecedor` int(10) UNSIGNED NOT NULL,
  `compra_compra` tinyint(1) NOT NULL COMMENT '1 - Compra, 0 - Orçamento ',
  `compra_data_compra` date NOT NULL,
  `compra_numero_nota` varchar(255) NOT NULL,
  `compra_observacoes` text NOT NULL,
  `compra_frete_externo` double UNSIGNED NOT NULL,
  `compra_subst_tributaria` double UNSIGNED NOT NULL,
  `compra_outras_despesas` double UNSIGNED NOT NULL,
  `compra_total` double UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas`
--

CREATE TABLE `contas` (
  `conta_id` int(10) UNSIGNED NOT NULL,
  `conta_nome` varchar(255) NOT NULL,
  `conta_saldo_inicial` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatos`
--

CREATE TABLE `contatos` (
  `contato_id` int(10) UNSIGNED NOT NULL,
  `contato_nome_razao_social` varchar(255) NOT NULL,
  `contato_cpf_cnpj` bigint(20) UNSIGNED NOT NULL,
  `contato_nome_fantasia` varchar(255) NOT NULL,
  `contato_nome_contato` varchar(255) NOT NULL,
  `contato_cep` int(10) UNSIGNED NOT NULL,
  `contato_fk_estado` int(10) UNSIGNED NOT NULL,
  `contato_fk_cidade` int(10) UNSIGNED NOT NULL,
  `contato_endereco` varchar(255) NOT NULL,
  `contato_numero` varchar(6) NOT NULL,
  `contato_complemento` varchar(255) NOT NULL,
  `contato_bairro` varchar(255) NOT NULL,
  `contato_cliente_final` tinyint(1) NOT NULL,
  `contato_data_nacimento` date NOT NULL,
  `contato_observacao` text NOT NULL,
  `contato_cliente` tinyint(1) NOT NULL,
  `contato_fornecedor` tinyint(1) NOT NULL,
  `contato_transportadora` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_contatos`
--

CREATE TABLE `email_contatos` (
  `email_id` int(10) UNSIGNED NOT NULL,
  `email_fk_contato` int(10) UNSIGNED NOT NULL,
  `email_descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `extrato`
--

CREATE TABLE `extrato` (
  `extrato_id` int(10) UNSIGNED NOT NULL,
  `extrato_fk_conta` int(10) UNSIGNED NOT NULL,
  `extrato_mes_ano` date NOT NULL,
  `extrato_saldo_anterior` double NOT NULL,
  `extrato_salnto_final` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamentos`
--

CREATE TABLE `forma_pagamentos` (
  `forma_pgto_id` int(10) UNSIGNED NOT NULL,
  `forma_pgto_descricao` varchar(255) NOT NULL,
  `forma_pgto_fk_conta` int(10) UNSIGNED NOT NULL,
  `forma_pgto_tipo_custo` int(11) NOT NULL,
  `forma_pgto_custo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_compra`
--

CREATE TABLE `item_compra` (
  `item_compra_id` int(10) UNSIGNED NOT NULL,
  `item_compra_fk_compra` int(10) UNSIGNED NOT NULL,
  `item_compra_fk_produto_servico` int(10) UNSIGNED NOT NULL,
  `item_compra_custo_unitario` double UNSIGNED NOT NULL,
  `item_compra_quantidade` int(10) UNSIGNED NOT NULL,
  `item_compra_desconto` double NOT NULL,
  `item_compra_outros_custos` double NOT NULL,
  `item_compra_ipi` double NOT NULL,
  `item_compra_subst` double NOT NULL,
  `item_compra_total` double UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `item_venda_id` int(10) UNSIGNED NOT NULL,
  `item_venda_fk_venda` int(10) UNSIGNED NOT NULL,
  `item_venda_fk_produto_servico` int(10) UNSIGNED NOT NULL,
  `item_venda_preco_venda` double UNSIGNED NOT NULL,
  `item_venda_quantidade` int(10) UNSIGNED NOT NULL,
  `item_venda_desconto` double NOT NULL,
  `item_venda_total` double NOT NULL,
  `item_venda_observacoes adicional` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_servico`
--

CREATE TABLE `lista_servico` (
  `lista_servico_id` int(11) NOT NULL,
  `lista_servico_nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `motivo_ajuste`
--

CREATE TABLE `motivo_ajuste` (
  `motivo_ajuste_id` int(10) UNSIGNED NOT NULL,
  `motivo_ajuste_descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `pagamentos_id` int(10) UNSIGNED NOT NULL,
  `pagamentos_fk_compra` int(10) UNSIGNED DEFAULT NULL,
  `pagamentos_descricao` varchar(255) NOT NULL,
  `pagamentos_parcela` varchar(255) NOT NULL,
  `pagamentos_valor` double UNSIGNED NOT NULL,
  `pagamentos_data_pagamento` date NOT NULL,
  `pagamentos_fk_forma_pgto` int(10) UNSIGNED NOT NULL,
  `pagamentos_fk_conta_origem` int(10) UNSIGNED NOT NULL,
  `pagamentos_pago` tinyint(1) NOT NULL COMMENT '1 - Sim, 0 - Não',
  `pagamentos_numero_documento` varchar(255) NOT NULL,
  `pagamentos_pago_a_fk_fornecedor` int(10) UNSIGNED NOT NULL,
  `pagamentos_data_competencia` date NOT NULL,
  `pagamentos_data_vencimento` date NOT NULL,
  `pagamentos_fk_categoria` int(10) UNSIGNED NOT NULL,
  `pagamentos_informacoes_adicionais` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `produto_id` int(10) UNSIGNED NOT NULL,
  `produto_codigo_proprio` varchar(255) NOT NULL,
  `produto_fk_categoria` int(10) UNSIGNED NOT NULL,
  `produto_preco_custo` double UNSIGNED NOT NULL,
  `produto_margin_lucro` float UNSIGNED NOT NULL,
  `produto_controlar_estoque` tinyint(1) NOT NULL,
  `produto_estoque_atual` int(11) NOT NULL,
  `produto_estoque_minimo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_servicos`
--

CREATE TABLE `produtos_servicos` (
  `prod_serv_id` int(10) UNSIGNED NOT NULL,
  `prod_serv_nome` varchar(255) NOT NULL,
  `prod_serv_preco_venda` double UNSIGNED NOT NULL,
  `prod_serv_anotacao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `recebimentos`
--

CREATE TABLE `recebimentos` (
  `recebimentos_id` int(10) UNSIGNED NOT NULL,
  `recebimentos_fk_venda` int(10) UNSIGNED DEFAULT NULL,
  `recebimentos_descricao` varchar(255) NOT NULL,
  `recebimentos_parcela` varchar(255) NOT NULL,
  `recebimentos_valor` double UNSIGNED NOT NULL,
  `recebimentos_data_recebimento` date NOT NULL,
  `recebimentos_fk_forma_pgto` int(10) UNSIGNED NOT NULL,
  `recebimentos_fk_conta_origem` int(10) UNSIGNED NOT NULL,
  `recebimentos_recebido` tinyint(1) NOT NULL COMMENT '1 - Sim, 0 - Não',
  `recebimentos_numero_documento` varchar(255) NOT NULL,
  `recebimentos_recebido_de_fk_contato` int(10) UNSIGNED NOT NULL,
  `recebimentos_data_competencia` date NOT NULL,
  `recebimentos_data_vencimento` date NOT NULL,
  `recebimentos_fk_categoria` int(10) UNSIGNED NOT NULL,
  `recebimentos_informacoes_adicionais` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `servicos_id` int(10) UNSIGNED NOT NULL,
  `servicos_fk_lista_servico` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefones_contato`
--

CREATE TABLE `telefones_contato` (
  `telefones_id` int(10) UNSIGNED NOT NULL,
  `telefones_fk_contato` int(10) UNSIGNED NOT NULL,
  `telefones_descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `venda_id` int(10) UNSIGNED NOT NULL,
  `venda_fk_contato_cliente` int(10) UNSIGNED NOT NULL,
  `venda_venda_orcamento` tinyint(1) NOT NULL COMMENT '1 - Venda, 0 - Orçamento',
  `venda_data_venda` date NOT NULL,
  `venda_observacoes` text NOT NULL,
  `venda_fk_vendedor` int(10) UNSIGNED NOT NULL,
  `venda_consumidor_final` tinyint(1) NOT NULL COMMENT '1 - Sim, 0 - Bão',
  `venda_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ajuste_estoque`
--
ALTER TABLE `ajuste_estoque`
  ADD PRIMARY KEY (`ajuste_id`);

--
-- Indexes for table `ajuste_preco_venda`
--
ALTER TABLE `ajuste_preco_venda`
  ADD PRIMARY KEY (`ajuste_pv_id`);

--
-- Indexes for table `categoria_despesas`
--
ALTER TABLE `categoria_despesas`
  ADD PRIMARY KEY (`categoria_despesa_id`);

--
-- Indexes for table `categoria_produtos`
--
ALTER TABLE `categoria_produtos`
  ADD PRIMARY KEY (`pcategoria_id`);

--
-- Indexes for table `categoria_receitas`
--
ALTER TABLE `categoria_receitas`
  ADD PRIMARY KEY (`categoria_receita_id`);

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`compra_id`);

--
-- Indexes for table `contas`
--
ALTER TABLE `contas`
  ADD PRIMARY KEY (`conta_id`);

--
-- Indexes for table `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`contato_id`);

--
-- Indexes for table `email_contatos`
--
ALTER TABLE `email_contatos`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `extrato`
--
ALTER TABLE `extrato`
  ADD PRIMARY KEY (`extrato_id`);

--
-- Indexes for table `forma_pagamentos`
--
ALTER TABLE `forma_pagamentos`
  ADD PRIMARY KEY (`forma_pgto_id`);

--
-- Indexes for table `item_compra`
--
ALTER TABLE `item_compra`
  ADD PRIMARY KEY (`item_compra_id`);

--
-- Indexes for table `item_venda`
--
ALTER TABLE `item_venda`
  ADD PRIMARY KEY (`item_venda_id`);

--
-- Indexes for table `motivo_ajuste`
--
ALTER TABLE `motivo_ajuste`
  ADD PRIMARY KEY (`motivo_ajuste_id`);

--
-- Indexes for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`pagamentos_id`);

--
-- Indexes for table `produtos_servicos`
--
ALTER TABLE `produtos_servicos`
  ADD PRIMARY KEY (`prod_serv_id`);

--
-- Indexes for table `recebimentos`
--
ALTER TABLE `recebimentos`
  ADD PRIMARY KEY (`recebimentos_id`);

--
-- Indexes for table `telefones_contato`
--
ALTER TABLE `telefones_contato`
  ADD PRIMARY KEY (`telefones_id`);

--
-- Indexes for table `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`venda_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ajuste_estoque`
--
ALTER TABLE `ajuste_estoque`
  MODIFY `ajuste_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ajuste_preco_venda`
--
ALTER TABLE `ajuste_preco_venda`
  MODIFY `ajuste_pv_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categoria_despesas`
--
ALTER TABLE `categoria_despesas`
  MODIFY `categoria_despesa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categoria_produtos`
--
ALTER TABLE `categoria_produtos`
  MODIFY `pcategoria_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categoria_receitas`
--
ALTER TABLE `categoria_receitas`
  MODIFY `categoria_receita_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `compra_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contas`
--
ALTER TABLE `contas`
  MODIFY `conta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contatos`
--
ALTER TABLE `contatos`
  MODIFY `contato_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_contatos`
--
ALTER TABLE `email_contatos`
  MODIFY `email_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extrato`
--
ALTER TABLE `extrato`
  MODIFY `extrato_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forma_pagamentos`
--
ALTER TABLE `forma_pagamentos`
  MODIFY `forma_pgto_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_compra`
--
ALTER TABLE `item_compra`
  MODIFY `item_compra_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `item_venda_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `motivo_ajuste`
--
ALTER TABLE `motivo_ajuste`
  MODIFY `motivo_ajuste_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `pagamentos_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produtos_servicos`
--
ALTER TABLE `produtos_servicos`
  MODIFY `prod_serv_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recebimentos`
--
ALTER TABLE `recebimentos`
  MODIFY `recebimentos_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telefones_contato`
--
ALTER TABLE `telefones_contato`
  MODIFY `telefones_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendas`
--
ALTER TABLE `vendas`
  MODIFY `venda_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
