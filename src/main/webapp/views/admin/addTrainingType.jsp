<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Add Training Type</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/feather.css">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/tabler-icons.min.css">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/style.css">

</head>


<body>

<div class="main-wrapper">

    <div class="page-wrapper">

        <div class="content">

            <!-- ================= BREADCRUMB ================= -->

            <div class="page-breadcrumb mb-3">

                <h2 class="mb-1">
                    Add Training Type
                </h2>

                <nav>

                    <ol class="breadcrumb mb-0">

                        <li class="breadcrumb-item">

                            <a href="<%= request.getContextPath() %>/training-type">
                                Training Type
                            </a>

                        </li>

                        <li class="breadcrumb-item active">
                            Add Training Type
                        </li>

                    </ol>

                </nav>

            </div>


            <!-- ================= FORM CARD ================= -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Add Training Type
                    </h5>

                </div>


                <div class="card-body">

                    <form action="<%= request.getContextPath() %>/training-type"
                          method="post">

                        <input type="hidden"
                               name="action"
                               value="add">


                        <div class="row">


                            <!-- TRAINING TYPE -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Training Type
                                    </label>

                                    <input type="text"
                                           name="trainingTypeName"
                                           class="form-control"
                                           placeholder="Enter training type"
                                           required>

                                </div>

                            </div>


                            <!-- DESCRIPTION -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Description
                                    </label>

                                    <textarea name="description"
                                              class="form-control"
                                              rows="4"
                                              placeholder="Enter description"
                                              required></textarea>

                                </div>

                            </div>


                            <!-- STATUS -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Status
                                    </label>

                                    <select name="status"
                                            class="form-select"
                                            required>

                                        <option value="Active">
                                            Active
                                        </option>

                                        <option value="Inactive">
                                            Inactive
                                        </option>

                                    </select>

                                </div>

                            </div>


                        </div>


                        <!-- ================= BUTTONS ================= -->

                        <div class="d-flex justify-content-end">

                            <a href="<%= request.getContextPath() %>/training-type"
                               class="btn btn-light me-2">

                                Cancel

                            </a>


                            <button type="submit"
                                    class="btn btn-primary">

                                Add Training Type

                            </button>

                        </div>


                    </form>

                </div>

            </div>

        </div>

    </div>

</div>


<script src="<%= request.getContextPath() %>/assets/js/jquery-3.7.1.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/feather.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/script.js"></script>

</body>

</html>